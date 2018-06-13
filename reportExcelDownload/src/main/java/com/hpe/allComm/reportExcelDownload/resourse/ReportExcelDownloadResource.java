package com.hpe.allComm.reportExcelDownload.resourse;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.osgi.service.component.annotations.Component;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.hpe.allComm.reportExcelDownload.constants.ReportExcelDownloadPortletKeys;
import com.hpe.allComm.reportExcelDownload.portlet.ReportExcelDownloadPortlet;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.util.ParamUtil;

@Component(property = { "javax.portlet.name=" + ReportExcelDownloadPortletKeys.ReportExcelDownload,
		"mvc.command.name=/report/download" }, service = MVCResourceCommand.class)

public class ReportExcelDownloadResource implements MVCResourceCommand {

	Log log = LogFactoryUtil.getLog(ReportExcelDownloadPortlet.class);

	@SuppressWarnings("unchecked")
	@Override
	public boolean serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws PortletException {

		System.out.println("----inside Resource");

		String exampleRadios = ParamUtil.getString(resourceRequest, "exampleRadios");

		JSONObject jsonObj = JSONFactoryUtil.createJSONObject();
		JSONObject allObj = JSONFactoryUtil.createJSONObject();
		List<JSONArray> allArray = new ArrayList<>();

		JSONObject aObj = JSONFactoryUtil.createJSONObject();
		JSONArray aArr = JSONFactoryUtil.createJSONArray();
		aObj.put("DealId", "111");
		aObj.put("CustomerName", "AAAA");
		aObj.put("DiscountType", "front");
		aObj.put("Price", "1212");
		aArr.put(aObj);

		JSONObject bObj = JSONFactoryUtil.createJSONObject();
		JSONArray bArr = JSONFactoryUtil.createJSONArray();
		bObj.put("DealId", "2222");
		bObj.put("CustomerName", "BBBBB");
		bObj.put("DiscountType", "upfront");
		bObj.put("Price", "8989");
		bArr.put(bObj);

		JSONObject cObj = JSONFactoryUtil.createJSONObject();
		JSONArray cArr = JSONFactoryUtil.createJSONArray();
		cObj.put("DealId", "333");
		cObj.put("CustomerName", "CCCC");
		cObj.put("DiscountType", "front");
		cObj.put("Price", "2423");
		cArr.put(cObj);

		allArray.add(aArr);
		allArray.add(bArr);
		allArray.add(cArr);

		jsonObj.put("result", allArray);

		// Excel Download
		if (exampleRadios.equalsIgnoreCase("excel")) {

			log.info("-----Excel---");

			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet(ReportExcelDownloadPortletKeys.ReportExcelSheet);

			XSSFRow rowhead = sheet.createRow((short) 0);
			String excelHeader[] = ReportExcelDownloadPortletKeys.ReportExcelHeader;

			int i = 0;
			for (String head : excelHeader) {
				rowhead.createCell(i).setCellValue(head);
				i++;
			}
			int rowNum = 1;
			List<JSONArray> allArrayX = (List<JSONArray>) jsonObj.get("result");

			for (int rowIndex = 0; rowIndex < allArrayX.size(); rowIndex++) {
				Row row = sheet.createRow(rowNum);

				JSONArray arrayX = (JSONArray) allArrayX.get(rowIndex);
				for (int columnIndex = 0; columnIndex < arrayX.length(); columnIndex++) {
					Cell cell;
					JSONObject aObjX = arrayX.getJSONObject(columnIndex);
					cell = row.createCell(0);
					cell.setCellValue(aObjX.get("DealId").toString());
					cell = row.createCell(1);
					cell.setCellValue(aObjX.get("CustomerName").toString());
					cell = row.createCell(2);
					cell.setCellValue(aObjX.get("DiscountType").toString());
					cell = row.createCell(3);
					cell.setCellValue(aObjX.get("Price").toString());

				}
				rowNum++;
			}

			OutputStream outStrm = null;
			try {

				resourceResponse.setContentType("application/vnd.ms-excel");
				resourceResponse.setProperty("Content-Disposition",
						"attachment; filename=\"" + ReportExcelDownloadPortletKeys.ReportExcelFileName + ".xlsx\"");

				outStrm = resourceResponse.getPortletOutputStream();
				workbook.write(outStrm);

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			finally {
				try {
					outStrm.flush();
					outStrm.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

		// XML download
		else if (exampleRadios.equalsIgnoreCase("xml")) {

			log.info("-----XML---");

			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder;

			try {
				dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.newDocument();
				Element rootElement = doc
						.createElementNS("https://h21033.www2.hp.com https://h21033.www2.hp.com/deal9.xsd", "Deals");
				doc.appendChild(rootElement);

				List<JSONArray> allArrayX = (List<JSONArray>) jsonObj.get("result");
				for (JSONArray parentArray : allArrayX) {

					JSONArray arrayX = (JSONArray) parentArray;
					JSONObject aObjX = arrayX.getJSONObject(0);
					Element deal = doc.createElement("Deal");

					Iterator<String> keys = aObjX.keys();
					while (keys.hasNext()) {
						String key = keys.next();
						Element node = doc.createElement(key);
						node.appendChild(doc.createTextNode(aObjX.get(key).toString()));
						deal.appendChild(node);
						rootElement.appendChild(deal);

					}

				}

				OutputStream outStrm = null;
				Transformer transformer = TransformerFactory.newInstance().newTransformer();
				transformer.setOutputProperty(OutputKeys.INDENT, "yes");

				StreamResult result = new StreamResult(new StringWriter());
				DOMSource source = new DOMSource(doc);
				transformer.transform(source, result);

				String xmlString = result.getWriter().toString();
				System.out.println(xmlString);

				// Finally, send the response

				byte[] res = xmlString.getBytes(Charset.forName("UTF-8"));

				resourceResponse.setContentType("text/xml; charset=UTF-8");
				resourceResponse.setProperty("Content-Disposition",
						"attachment; filename=\"" + ReportExcelDownloadPortletKeys.ReportExcelFileName + ".xml\"");
				outStrm = resourceResponse.getPortletOutputStream();

				outStrm.write(res);

			} catch (DOMException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParserConfigurationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (TransformerFactoryConfigurationError e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (TransformerConfigurationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (TransformerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		// Text file Download
		else if (exampleRadios.equalsIgnoreCase("text")) {

			log.info("-----Text---");
			byte[] res = null;
			String[] values = null;
			OutputStream outputStream = null;
			try {

				resourceResponse.setContentType("application/octet-stream");
				resourceResponse.setProperty("Content-Disposition",
						"attachment; filename=\"" + ReportExcelDownloadPortletKeys.ReportExcelFileName + ".txt\"");
				outputStream = resourceResponse.getPortletOutputStream();

			/*			
				List<JSONArray> allArrayX = (List<JSONArray>) jsonObj.get("result");
				for (JSONArray parentArray : allArrayX) {

					JSONArray arrayX = (JSONArray) parentArray;
					JSONObject aObjX = arrayX.getJSONObject(0);
					Iterator<String> keys = aObjX.keys();

					while (keys.hasNext()) {
						String key = keys.next();
						String val = key + " | " + aObjX.get(key) + "\n";
						res = val.getBytes();
						output.write(res);
					}
				
				}
					res = stringBuilder.toString().getBytes();
				
				*/
				
				PrintWriter printWriter
				   = new PrintWriter(outputStream);
				
				System.getProperty("line.separator");
		        StringBuilder stringBuilder = new StringBuilder("");
		        List<JSONArray> allArrayX = (List<JSONArray>) jsonObj.get("result");
				for (JSONArray parentArray : allArrayX) {

					JSONArray arrayX = (JSONArray) parentArray;
					JSONObject aObjX = arrayX.getJSONObject(0);
					Iterator<String> keys = aObjX.keys();
					
					while (keys.hasNext()) {
						String key = keys.next();
						stringBuilder.append(key + " | " + aObjX.get(key)+ "\n" );
						printWriter.print(stringBuilder);
					}
					printWriter.println();
				}
				System.out.print("--stringBuilder-"+printWriter);
				
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (TransformerFactoryConfigurationError e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;

	}
}

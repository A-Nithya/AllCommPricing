package com.hpe.allcomm.search.pricing.resourse;

import java.io.IOException;
import java.io.OutputStream;
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

import org.osgi.service.component.annotations.Component;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.hpe.allcomm.search.pricing.constants.AllcommSearchPricingWebPortletKeys;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.util.ParamUtil;


@Component(property = { "javax.portlet.name=" + AllcommSearchPricingWebPortletKeys.AllcommSearchPricingWeb,
"mvc.command.name=/report/download" }, service = MVCResourceCommand.class)

public class AllCommSearchPricingResourseReportDownload implements MVCResourceCommand{
	

	Log log = LogFactoryUtil.getLog(AllCommSearchPricingResourseReportDownload.class);
	@Override
	public boolean serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws PortletException {
		System.out.println("----inside Resource");

		String download = ParamUtil.getString(resourceRequest, "download");
		System.out.println("download ->"+download);
		JSONObject jsonObj = JSONFactoryUtil.createJSONObject();
		List<JSONArray> allArray = new ArrayList<>();

		JSONObject aObj = JSONFactoryUtil.createJSONObject();
		JSONArray aArr = JSONFactoryUtil.createJSONArray();
	
		aObj.put("CountryCode", "US");
		aObj.put("ProductNumber", "120672-B21");
		aObj.put("PL", "SH");
		aObj.put("PLDescription", "Focus Options");
		aObj.put("Shortescription", "HPE Rack Ballast Kit");
		aObj.put("LongDescription", "HPE 9000 and 10000 Rack Ballast Kit");
		aObj.put("DiscHierarchyFamilyDescription", "Racks & Power"); 
		aObj.put("DiscHierarchyFamilyID", "24NM");
		aObj.put("DiscHierarchySeriesDescription", "ProLiant Server - Racks & Power");
		aObj.put("DiscHierarchySeriesID", "24NS");
		aObj.put("DiscHierarchyModelDescription", "ProLiant Racks & Rack Accessories");
		aObj.put("DiscHierarchyModelID", "24NV");
		aObj.put("PreviousListPrice", "dwdwsw");
		aObj.put("NewListPrice", "459");	
		aObj.put("ListPrice","12312");
		aObj.put("EffectiveDate", "2003-09-29");
		aObj.put("QtyBreak", "1");
		aObj.put("UOM", "Each");
		aObj.put("PriceChangeCode", "32423");
		aObj.put("PriceChangeDate", "2003-09-29");
		aObj.put("PLCStatus", "GA");
		aObj.put("PLCEffectiveDate", "2002-09-25");
		aObj.put("ReplacementProduct", "4234");
		aObj.put("ProductChangeCode", "3413");
		aObj.put("ProductChangeDate", "2018-06-08");
		aObj.put("UPCCode", "743172836724");
		aObj.put("Serialization", "No");
		aObj.put("WarrantyCode", "A069");
		aObj.put("Weight", "45359");
		aObj.put("UnitofWeight", "G");
		aObj.put("DateTimeStamp", "2018-06-13 02:04:02");
		aArr.put(aObj);

		JSONObject bObj = JSONFactoryUtil.createJSONObject();
		JSONArray bArr = JSONFactoryUtil.createJSONArray();
		bObj.put("CountryCode", "UK");
		bObj.put("ProductNumber", "120672-B21");
		bObj.put("PL", "SH");
		bObj.put("PLDescription", "Focus Options");
		bObj.put("ShortDescription", "HPE Rack Ballast Kit");
		bObj.put("LongDescription", "HPE 9000 and 10000 Rack Ballast Kit");
		bObj.put("DiscHierarchyFamilyDescription", "Racks & Power"); 
		bObj.put("DiscHierarchyFamilyID", "24NM");
		bObj.put("DiscHierarchySeriesDescription", "ProLiant Server - Racks & Power");
		bObj.put("DiscHierarchySeriesID", "24NS");
		bObj.put("DiscHierarchyModelDescription", "ProLiant Racks & Rack Accessories");
		bObj.put("DiscHierarchyModelID", "24NV");
		bObj.put("PreviousistPrice", "24r523");
		bObj.put("NewListPrice", "459");	
		bObj.put("ListPrice","12312");
		bObj.put("EffectiveDate", "2003-09-29");
		bObj.put("QtyBreak", "1");
		bObj.put("UOM", "Each");
		bObj.put("PriceChangeCode", "234");
		bObj.put("PriceChangeDate", "2003-09-29");
		bObj.put("PLCStatus", "GA");
		bObj.put("PLCEffectiveDate", "2002-09-25");
		bObj.put("ReplacementProduct", "234");
		bObj.put("ProductChangeCode", "123");
		bObj.put("ProductChangeDate", "2018-06-08");
		bObj.put("UPCCode", "743172836724");
		bObj.put("Serialization", "No");
		bObj.put("WarrantyCode", "A069");
		bObj.put("Weight", "45359");
		bObj.put("UnitofWeight", "G");
		bArr.put(bObj);

		JSONObject cObj = JSONFactoryUtil.createJSONObject();
		JSONArray cArr = JSONFactoryUtil.createJSONArray();
		cObj.put("CountryCode", "IN");
		cObj.put("ProductNumber", "120672-B21");
		cObj.put("PL", "SH");
		cObj.put("PLDescription", "Focus Options");
		cObj.put("ShortDescription", "HPE Rack Ballast Kit");
		cObj.put("LongDescription", "HPE 9000 and 10000 Rack Ballast Kit");
		cObj.put("DiscHierarchyFamilyDescription", "Racks & Power"); 
		cObj.put("DiscHierarchyFamilyID", "24NM");
		cObj.put("DiscHierarchySeriesDescription", "ProLiant Server - Racks & Power");
		cObj.put("DiscHierarchySeriesID", "24NS");
		cObj.put("DiscHierarchyModelDescription", "ProLiant Racks & Rack Accessories");
		cObj.put("DiscHierarchyModelID", "24NV");
		cObj.put("PreviousListPrice", "VVVVVA");
		cObj.put("NewListPrice", "459");	
		cObj.put("ListPrice","12312");
		cObj.put("EffectiveDate", "2003-09-29");
		cObj.put("QtyBreak", "1");
		cObj.put("UOM", "Each");
		cObj.put("PriceChangeCode", "AAA");
		cObj.put("PriceChangeDate", "2003-09-29");
		cObj.put("PLCStatus", "GA");
		cObj.put("PLCEffectiveDate", "2002-09-25");
		cObj.put("ReplacementProduct", "AAA");
		cObj.put("ProductChangeCode", "AAA");
		cObj.put("ProductChangeDate", "2018-06-08");
		cObj.put("UPCCode", "743172836724");
		cObj.put("Serialization", "No");
		cObj.put("WarrantyCode", "A069");
		cObj.put("Weight", "45359");
		cObj.put("UnitofWeight", "G");
		cArr.put(cObj);

		allArray.add(aArr);
		allArray.add(bArr);
		allArray.add(cArr);

		jsonObj.put("result", allArray);

		//Excel Download
		if (download.equalsIgnoreCase("excel")) {

			log.info("-----Excel---");

			/*XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet(AllcommSearchPricingWebPortletKeys.AllCommPricingReportName);

			XSSFRow rowhead = sheet.createRow((short) 0);
			String excelHeader[] = AllcommSearchPricingWebPortletKeys.ReportExcelHeader;

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
					cell.setCellValue(aObjX.get("CountryCode").toString());
					cell = row.createCell(1);
					cell.setCellValue(aObjX.get("ProductNumber").toString());
					cell = row.createCell(2);
					cell.setCellValue(aObjX.get("PL").toString());;
					cell = row.createCell(3);
					cell.setCellValue(aObjX.get("PLDescription").toString());
					cell = row.createCell(4);
					cell.setCellValue(aObjX.get("ShortDescription").toString());
					cell = row.createCell(5);
					cell.setCellValue(aObjX.get("LongDescription").toString());
					cell = row.createCell(6);
					cell.setCellValue(aObjX.get("DiscHierarchyFamilyDescription").toString());
					cell = row.createCell(7);
					cell.setCellValue(aObjX.get("DiscHierarchyFamilyID").toString());
					cell = row.createCell(8);
					cell.setCellValue(aObjX.get("DiscHierarchySeriesDescription").toString());
					cell = row.createCell(9);
					cell.setCellValue(aObjX.get("DiscHierarchySeriesID").toString());
					cell = row.createCell(10);
					cell.setCellValue(aObjX.get("DiscHierarchyModelDescription").toString());
					cell = row.createCell(11);
					cell.setCellValue(aObjX.get("DiscHierarchyModelID").toString());
					cell = row.createCell(12);
					cell.setCellValue(aObjX.get("PreviousListPrice").toString());
					cell = row.createCell(13);
					cell.setCellValue(aObjX.get("NewListPrice").toString());
					cell = row.createCell(14);
					cell.setCellValue(aObjX.get("ListPriceEffectiveDate").toString());
					cell = row.createCell(15);
					cell.setCellValue(aObjX.get("QtyBreak").toString());
					cell = row.createCell(16);
					cell.setCellValue(aObjX.get("UOM").toString());
					cell = row.createCell(17);
					cell.setCellValue(aObjX.get("PriceChangeCode").toString());
					cell = row.createCell(18);
					cell.setCellValue(aObjX.get("PriceChangeDate").toString());
					cell = row.createCell(19);
					cell.setCellValue(aObjX.get("PLCStatus").toString());
					cell = row.createCell(20);
					cell.setCellValue(aObjX.get("PLCEffectiveDate").toString());
					cell = row.createCell(21);
					cell.setCellValue(aObjX.get("ReplacementProduct").toString());
					cell = row.createCell(22);
					cell.setCellValue(aObjX.get("ProductChangeCode").toString());
					cell = row.createCell(23);
					cell.setCellValue(aObjX.get("ProductChangeDate").toString());
					cell = row.createCell(24);
					cell.setCellValue(aObjX.get("UPCCode").toString());
					cell = row.createCell(25);
					cell.setCellValue(aObjX.get("Serialization").toString());
					cell = row.createCell(26);
					cell.setCellValue(aObjX.get("WarrantyCode").toString());
					cell = row.createCell(27);
					cell.setCellValue(aObj.get("Weight").toString());
					cell = row.createCell(28);
					cell.setCellValue(aObj.get("UnitofWeight").toString());
					cell = row.createCell(29);
				}
				rowNum++;
			}

			OutputStream outStrm = null;
			try {

				resourceResponse.setContentType("application/vnd.ms-excel");
				resourceResponse.setProperty("Content-Disposition",
						"attachment; filename=\"" + AllcommSearchPricingWebPortletKeys.AllCommPricingReportName + ".xlsx\"");

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
			}*/
		}
			//XML download
			else if (download.equalsIgnoreCase("xml")) {

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

					 log.info("====rootElement=="+rootElement);
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
							"attachment; filename=\"" +  AllcommSearchPricingWebPortletKeys.AllCommPricingReportName + ".xml\"");
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

			
			//Text file Download
			else if (download.equalsIgnoreCase("text")) {

				log.info("-----Text---");
				PrintWriter printWriter = null;	
				try {			
					        
					resourceResponse.setContentType("application/octet-stream");
					resourceResponse.setProperty("Content-Disposition",
							"attachment; filename=\"" +  AllcommSearchPricingWebPortletKeys.AllCommPricingReportName + ".txt\"");
								
					printWriter = resourceResponse.getWriter();
					List<JSONArray> allArrayX = (List<JSONArray>) jsonObj.get("result");
					for (JSONArray parentArray : allArrayX) {
					
						JSONArray arrayX = (JSONArray) parentArray;
						JSONObject aObjX = arrayX.getJSONObject(0);
						Iterator<String> keys = aObjX.keys();
						while (keys.hasNext()) {
							String key = keys.next();
							printWriter.write(key+" | "+aObjX.get(key));
							printWriter.println();
						}
						printWriter.println();

					}
				
					System.out.println("----------"+printWriter.toString());
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




package com.hpe.allComm.emailNotification.actionCommand;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.internet.InternetAddress;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.osgi.service.component.annotations.Component;

import com.hpe.allComm.emailNotification.constants.EmailNotificationPortletKeys;
import com.liferay.mail.kernel.model.MailMessage;
import com.liferay.mail.kernel.service.MailServiceUtil;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.service.PortalPreferencesLocalServiceUtil;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.PropsKeys;
import com.liferay.portal.kernel.util.PropsUtil;

@Component(
	    immediate = true,
	    property = {
	        "javax.portlet.name=" + EmailNotificationPortletKeys.EmailNotification,
	        "mvc.command.name=/email/notification"
	    },
	    service = MVCActionCommand.class
	)

public class EmailNotificationActionCommand extends BaseMVCActionCommand {

	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {


         String receiverName=ParamUtil.getString(actionRequest,"receiverName");
         String receiverEmailAddess=ParamUtil.getString(actionRequest,"receiverEmailAddess");
	     String mailSubject=ParamUtil.getString(actionRequest,"mailSubject");
         String mailBody=ParamUtil.getString(actionRequest,"mailBody");
         
         long companyId= PortalUtil.getCompanyId(actionRequest);
         
         MailMessage mailMessage= new MailMessage();
	     mailMessage.setSubject(mailSubject);
	     mailMessage.setBody(mailBody);
	     
	     InternetAddress fromAddress=getfromAddress(companyId);
	     mailMessage.setFrom(fromAddress);          
	     mailMessage.setTo(new InternetAddress(receiverEmailAddess,receiverName));
	     
	     File file = mailAttachment(actionRequest,actionResponse);
	     
	     mailMessage.addFileAttachment(file);
	     MailServiceUtil.sendEmail(mailMessage);
     
        SessionMessages.add(actionRequest,"mail-send-success");

	

}
    private InternetAddress getfromAddress(long companyId) {
    	PortletPreferences portalPreferences=null;
    	portalPreferences=PortalPreferencesLocalServiceUtil.getPreferences(companyId,1);

    	String key1=PropsKeys.ADMIN_EMAIL_FROM_ADDRESS;
    	String fromEmail= portalPreferences.getValue(key1,PropsUtil.get(key1)); 
    	
    	
    	String key2=PropsKeys.ADMIN_EMAIL_FROM_NAME;
    	String fromName= portalPreferences.getValue(key2,PropsUtil.get(key2));
    	
    	InternetAddress fromAddress= new InternetAddress();
    	fromAddress.setAddress(fromEmail);
      	try {
			fromAddress.setPersonal(fromName);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return fromAddress;
	}
    
    
    private File mailAttachment(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException, InvalidFormatException{
    	
    	
    	////
    	JSONObject jsonObj = JSONFactoryUtil.createJSONObject();
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
		////
		
		
		

		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet(EmailNotificationPortletKeys.EmailAttachment);

		XSSFRow rowhead = sheet.createRow((short) 0);
		String excelHeader[] = EmailNotificationPortletKeys.EmailHeader;

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
		FileOutputStream fileOut=null;
		File file=null;
	try {
		
	    file = new File(EmailNotificationPortletKeys.EmailAttachment+".xlsx");
		fileOut= new FileOutputStream(file);
		workbook.write(fileOut);
     

	} catch (FileNotFoundException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}

	finally {
		workbook.close();
		fileOut.close();
	}
	
	return file;
    }

}
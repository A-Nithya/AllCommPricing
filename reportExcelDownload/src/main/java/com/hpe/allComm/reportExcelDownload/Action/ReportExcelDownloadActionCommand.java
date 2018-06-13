package com.hpe.allComm.reportExcelDownload.Action;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;

import com.hpe.allComm.reportExcelDownload.constants.ReportExcelDownloadPortletKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;

@Component(
	    immediate = true,
	    property = {
	        "javax.portlet.name=" + ReportExcelDownloadPortletKeys.ReportExcelDownload,
	        "mvc.command.name=/report/excelDownload"
	    },
	    service = MVCActionCommand.class
	)
public class ReportExcelDownloadActionCommand extends BaseMVCActionCommand{

	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
	
		

		
	}		
	
}

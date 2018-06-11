package com.hpe.allComm.pricingReport.action;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;

import com.hpe.allComm.pricingReport.constants.AllCommPricingReportPortletKeys;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.util.ParamUtil;

@Component(immediate = true, property = { "javax.portlet.name=" + AllCommPricingReportPortletKeys.AllCommPricingReport,
		"mvc.command.name=/allComm/quickSearch" }, service = MVCActionCommand.class)
public class AllCommPricingReportActionCommand extends BaseMVCActionCommand {

	Log log = LogFactoryUtil.getLog(AllCommPricingReportActionCommand.class);

	
	public void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {

		String selectedValue = ParamUtil.getString(actionRequest, "selectedValue");
		String savedReports = ParamUtil.getString(actionRequest, "savedReports");
		String standardReports = ParamUtil.getString(actionRequest, "standardReports");

		JSONObject reportValue = JSONFactoryUtil.createJSONObject();

		reportValue.put("selectedValue", selectedValue);
		reportValue.put("savedReports", savedReports);
		reportValue.put("standardReports", standardReports);

		actionRequest.setAttribute("reportValue", reportValue);
	    actionResponse.setRenderParameter("jspPage", "/view.jsp");

	}
	


}
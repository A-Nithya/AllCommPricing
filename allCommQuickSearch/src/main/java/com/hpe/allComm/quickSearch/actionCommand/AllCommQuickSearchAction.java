package com.hpe.allComm.quickSearch.actionCommand;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;

import com.hpe.allComm.quickSearch.constants.AllCommQuickSearchPortletKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;

@Component(
	    immediate = true,
	    property = {
	        "javax.portlet.name=" + AllCommQuickSearchPortletKeys.AllCommQuickSearch,
	        "mvc.command.name=/allComm/quickSearch"
	    },
	    service = MVCActionCommand.class
	)
public class AllCommQuickSearchAction extends BaseMVCActionCommand{

	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
		// TODO Auto-generated method stub
		
	}


}

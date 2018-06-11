package com.hpe.allComm.pricingReport.portlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

import com.hpe.allComm.pricingReport.constants.AllCommPricingReportPortletKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

/**
 * @author NI40007637
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=false",
		"javax.portlet.display-name=allCommPricingReport Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + AllCommPricingReportPortletKeys.AllCommPricingReport,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"

	},
	service = Portlet.class
)

public class AllCommPricingReportPortlet extends MVCPortlet {
	

}
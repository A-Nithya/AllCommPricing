package com.hpe.allcomm.search.pricing.portlet;

import com.hpe.allcomm.search.pricing.constants.AllcommSearchPricingWebPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

/**
 * @author NI40007637
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=false",
		"javax.portlet.display-name=allcomm-search-pricing-web Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/pricing/view.jsp",
		"javax.portlet.name=" + AllcommSearchPricingWebPortletKeys.AllcommSearchPricingWeb,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user",
		"com.liferay.portlet.header-portlet-css=/css/style.css",
		"com.liferay.portlet.header-portlet-css=/css/bootstrap.min.css"
	},
	service = Portlet.class
)
public class AllcommSearchPricingWebPortlet extends MVCPortlet {
}
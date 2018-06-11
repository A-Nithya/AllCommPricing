package com.hpe.allComm.quickSearch.portlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

import com.hpe.allComm.quickSearch.constants.AllCommQuickSearchPortletKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

/**
 * @author NI40007637
 */
@Component(immediate = true, property = { "com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=false", "javax.portlet.display-name=allCommQuickSearch Portlet",
		"javax.portlet.init-param.template-path=/", "javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + AllCommQuickSearchPortletKeys.AllCommQuickSearch,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user" }, service = Portlet.class)
public class AllCommQuickSearchPortlet extends MVCPortlet {
	
}
package com.hpe.allComm.emailNotification.portlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

import com.hpe.allComm.emailNotification.constants.EmailNotificationPortletKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

/**
 * @author NI40007637
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=emailNotification Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + EmailNotificationPortletKeys.EmailNotification,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class EmailNotificationPortlet extends MVCPortlet {
	
	}
<%@ include file="init.jsp" %>

<p>
	<b><liferay-ui:message key="emailNotification.caption"/></b>
</p>

<liferay-portlet:actionURL var="sendEmailURL" name="/email/notification" />

<aui:form action="${sendEmailURL}" id="emailSubmit">
	
		Name:<input type="text" id="<portlet:namespace/>receiverName" name="<portlet:namespace/>receiverName" ><br>
		E-mail:<input type="text" id="<portlet:namespace/>receiverEmailAddess" name="<portlet:namespace/>receiverEmailAddess" ><br>
		Subject:<br><textarea rows="2" cols="70" id="<portlet:namespace/>mailSubject" name="<portlet:namespace/>mailSubject"></textarea><br>
		Body:<br><textarea rows="8" cols="70" id="<portlet:namespace/>mailBody" name="<portlet:namespace/>mailBody"></textarea><br>

	   <aui:button id="<portlet:namespace/>sendEmailSubmit" value="Submit" type="submit"/>
</aui:form>


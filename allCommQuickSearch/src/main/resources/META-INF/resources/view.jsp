<%@ include file="init.jsp"%>



<%
	long plidValue = 0;
	plidValue = PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(), "AllCommPricingReport");
	String selectedValue = ParamUtil.getString(renderRequest, "selectedValue");
	System.out.print("---Plid Value" + plidValue);
	
%>


<liferay-portlet:actionURL var="quickSearchURL"
	name="/allComm/quickSearch" plid="<%=plidValue%>"
	portletName="AllCommPricingReport" />



<aui:form action="${quickSearchURL}" useNamespace="false">


	<div class="dropdown">
		Saved Reports <select id="savedReports">
			<option value="Link1">Link 1</option>
			<option value="link2">Link 2</option>
			<option value="link3">Link 3</option>
		</select>
	</div>
	<br />
	<div class="dropdown">
		Standard Reports <select id="standardReports">
			<option value="Link3">Link 3</option>
			<option value="link4">Link 4</option>
			<option value="link5">Link 5</option>
		</select>
	</div>


	<div id="_AllCommPricingReport_pricingBlock">
		<input type="radio" id="p1" name="Pricing" value="Standard Pricing"
			checked>Standard Pricing<br> <input type="radio" id="p2"
			name="Pricing" value="Special Pricing">Special Pricing<br>
		<input type="radio" id="p3" name="Pricing" value="Subscription">Subscription<br>

	</div>

	<aui:button id="quickSearchSubmit" value="Submit" />
</aui:form>

<script>
	$('#quickSearchSubmit').click(
			function() {

				console.log('=== quick search clicked===');
				var pricing_value;
				if ($('#p1').is(":checked")) {
					pricing_value = $('#p1').val();
				} else if ($('#p2').is(":checked")) {
					pricing_value = $('#p2').val();
				} else if ($('#p3').is(":checked")) {
					pricing_value = $('#p3').val();
				}

				var url = '${quickSearchURL}';
				var selectedValue = pricing_value;
				var savedReports = $("#savedReports").val();
				var standardReports = $("#standardReports").val();

				url += "&_AllCommPricingReport_selectedValue=" + selectedValue
						+ "&_AllCommPricingReport_savedReports=" + savedReports
						+ "&_AllCommPricingReport_standardReports="
						+ standardReports;

				location.href = url;

			});
</script>

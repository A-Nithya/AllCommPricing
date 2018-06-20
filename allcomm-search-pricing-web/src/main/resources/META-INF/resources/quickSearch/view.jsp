<%@ include file="init.jsp"%>

<%
	long plidValue = 0;

	plidValue = PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(), "AllcommSearchPricingWeb");

	String selectedValue = ParamUtil.getString(renderRequest, "selectedValue");

	System.out.print("PLID VALUE" + plidValue);
%>

<liferay-portlet:actionURL var="quickSearchURL"
	name="/allComm/quickSearch" plid="<%=plidValue%>"
	portletName="AllcommSearchPricingWeb" />

<aui:form action="${quickSearchURL}"  useNamespace="false">

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

	<div id="pricingBlock">
		<input type="radio" id="p1" name="Pricing" value="standardPricing"
			checked>Standard Pricing<br> <input type="radio" id="p2"
			name="Pricing" value="specialPricing">Special Pricing<br>
		<input type="radio" id="p3" name="Pricing" value="subscription">Subscription<br>
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

				url += "&_AllcommSearchPricingWeb_selectedValue=" + selectedValue
						+ "&_AllcommSearchPricingWeb_savedReports=" + savedReports
						+ "&_AllcommSearchPricingWeb_standardReports="+ standardReports;

				console.log(url);

				location.href = url;

			});
</script>

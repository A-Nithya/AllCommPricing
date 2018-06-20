<%@ include file="init.jsp"%>

<%
	String selectedValue = ParamUtil.getString(renderRequest, "selectedValue");

    System.out.println("selectedValue "+selectedValue);
    
%>

<div id="myTab">

	<ul class="nav nav-tabs">

		<%
			if (selectedValue.equals("standardPricing")) {
		%>
		<li class="active"><a href="#tab-1">Standard Price</a></li>
		<li><a href="#tab-2">Special Price</a></li>
		<li><a href="#tab-3">Subscription</a></li>


		<%
			} else if (selectedValue.equals("specialPricing")) {
		%>

		<li><a href="#tab-1">Standard Price</a></li>
		<li class="active"><a href="#tab-2">Special Price</a></li>
		<li><a href="#tab-3">Subscription</a></li>


		<%
			} else if (selectedValue.equals("subscription")) {
		%>

		<li><a href="#tab-1">Standard Price</a></li>
		<li><a href="#tab-2">Special Price</a></li>
		<li class="active"><a href="#tab-3">Subscription</a></li>


		<%
			}
		%>
	</ul>

	<div class="tab-content">
		<div id="tab-1" class="tab-pane">
			<jsp:include page='standardPricing.jsp'></jsp:include>
		</div>
		<div id="tab-2">
			<jsp:include page='specialPricing.jsp'></jsp:include>
		</div>
		<div id="tab-3">
			<jsp:include page='subscription.jsp'></jsp:include>
		</div>
	</div>

</div>


<script>
	YUI().use('aui-tabview', function(Y) {
		new Y.TabView({
			srcNode : '#myTab'
		}).render();
	});
</script>
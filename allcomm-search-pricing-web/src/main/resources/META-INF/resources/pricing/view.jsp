<%@ include file="init.jsp"%>

<%
	String selectedValue = ParamUtil.getString(renderRequest, "selectedValue");
%>

<div class="row pad15">

	<div class="col">

		<div class="row" id="<portlet:namespace/>pricingCheckPage" data=<%=selectedValue %>>

             <div id="<portlet:namespace/>reportPagePopUp" name="<portlet:namespace/>reportPagePopUp" 
              style="display: none;">
              <jsp:include page='reportPage.jsp'></jsp:include>
             </div>

            <div id="<portlet:namespace/>pricingTabPage" name="<portlet:namespace/>pricingTabPage" style="display: none;">
				<jsp:include page='pricingTabPage.jsp'></jsp:include>
             </div>

        <%-- 

			<%
				if (selectedValue.equals("standardPricing")) {
			%>


			<div
				id="<portlet:namespace/>exportJspCall" data-dismiss="modal"
				data-toggle="modal" data-target="#<portlet:namespace/>export"
				style="display: none;"></div>

			 <div id="<portlet:namespace/>exportPopUp"
				name="<portlet:namespace/>exportPopUp" style="display: none;">

				<jsp:include page='reportPage.jsp'></jsp:include>
			</div>
		 
			<%
				} else if (selectedValue.equals("specialPricing")) {
			%>
			<jsp:include page='pricingTabPage.jsp'></jsp:include>
			<%
				}
			%> --%>
		</div>

	</div>

</div>

<script>
	$(document).ready(function() {

		var pricingCheckPage = $("#<portlet:namespace/>pricingCheckPage").attr('data');
		console.log("=====pricingCheckPage===="+pricingCheckPage);
		
		if(pricingCheckPage == "standardPricing")
			{
			console.log("=====standardPricing===="+pricingCheckPage);
			
			$("#<portlet:namespace/>reportPagePopUp").show();
			$("#<portlet:namespace/>export").show();
			
			}
		else{
			console.log("===inside pricingTabPage======");

			$("#<portlet:namespace/>pricingTabPage").show();
		   }

	});
</script>

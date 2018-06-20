<%@ include file="init.jsp"%>

<%
	String selectedValue = ParamUtil.getString(renderRequest, "selectedValue");

    System.out.println("selectedValue REPORT "+selectedValue);
%>

<portlet:renderURL var="pricingTabPage">
	<portlet:param name="mvcPath" value="/pricing/pricingTabPage.jsp" />
	<portlet:param name="selectedValue" value="standardPricing" />
</portlet:renderURL>

<portlet:resourceURL id="/report/download" var="excelDownloadUrl" >
<portlet:param name="mvcPath" value="reportPage.jsp"/>
</portlet:resourceURL>

<div class="container">
    <div class="modal" id="<portlet:namespace/>export"
        name="<portlet:namespace/>export" role="dialog">

<div id="accordion">
 	<div class="card">
		<div class="card-header" id="headingOne">
					<a href="${pricingTabPage}"> Back to search</a>
			<div class="row">
				<label class="padding-left12 font35 label-normal label-black">
					Report 1</label>
				<button class="btn btn-link float-right marginleft75 font16"
					data-toggle="collapse" data-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">Collapse
					save option</button>
			</div>
		</div>

		<div id="collapseOne" class="collapse" data-parent="#accordion">
			<div class="card-body">
				<div class="row">
					<div class="col-3 ">
						<label class="label-bold label-black font18">select the
							format to download:</label>

						<div>
							<input class="radio-item" type="radio" 
								id="exampleRadios2"  name="<portlet:namespace/>exampleRadios"
						    	value="excel"> <label
								class="form-check-label col-6 label-black label-normal font16"
								for="exampleRadios2">MS Excel(xlsx) </label> <input
								class="radio-item" type="radio"
								id="exampleRadios2" name="<portlet:namespace/>exampleRadios"
						    	value="xml"> <label
								class="form-check-label label-black label-normal font16"
								for="exampleRadios2">XML </label>
						</div>
						<input class="radio-item" type="radio"
							id="exampleRadios"  name="<portlet:namespace/>exampleRadios"
						    	value="text"> <label
							class="form-check-label col-6 label-black label-normal font16"
							for="exampleRadios">Plain text(txt) </label>

						<div class="padding-top22">
							<button type="button"
								class="btn label-black inline-block label-bold action-btn download-btn font12"
								data-dismiss="modal" onclick="excelDownloadDocument()">Download</button>
						</div>
					</div>
					<div class="col-4">
						<label class="label-bold label-black font18">save and
							email report</label>
						<div class="border ">
							<label class="font12 label-black label-normal col-12">Name
								of report*</label> <label
								class="font12  label-grey label-normal padding-left16">My
								Offerings</label>
						</div>
						<div class="border">
							<label class="font12  label-black label-normal col-12">email
								address(optional)</label> <label
								class="font12  label-grey label-normal padding-left16">recipent@company.com</label>
						</div>
					</div>
					<div class="col-3">
						<div
							class="form-check label-medium font-size14  label-white padding-top43">
							<input
								class="form-check-input check-box margin-top0 li-between-spacing check-boxes"
								type="checkbox" value="" id="defaultCheck1"> <label
								class="form-check-label li-between-spacing label-black label-semibold paddingleft45 margin-btm paddingtop9 font16"
								for="defaultCheck1"> ZIP file before emailing </label>
						</div>

						<div class="padding-top18 padding-left30">
							<button
								class="label-bold label-grey inline-block submit-btns font16">Submit</button>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<table class="table table-striped label-normal label-black font16">
		<thead>
			<tr>
				<th scope="col">Product Number</th>
				<th scope="col">PL</th>
				<th scope="col">Short description</th>
				<th scope="col">List price current</th>
				<th scope="col">List price effective data</th>
				<th scope="col">Qty break</th>
				<th scope="col">PLC status</th>
				<th scope="col">PLC status date</th>
				<th scope="col">UOM</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td scope="row">120672-B21</td>
				<td>SH</td>
				<td>HPE Rack Ballast Kit</td>
				<td>459</td>
				<td>04-25-2015</td>
				<td>1</td>
				<td>GA</td>
				<td>09-25-2020</td>
				<td>Each</td>
			</tr>
			<tr>
				<td scope="row">234672-B21</td>
				<td>SH</td>
				<td>HPE Rack Ballast Kit</td>
				<td>276</td>
				<td>04-25-2015</td>
				<td>1</td>
				<td>GA</td>
				<td>09-25-2020</td>
				<td>Each</td>
			</tr>
			<tr>
				<td scope="row">234672-B21</td>
				<td>SH</td>
				<td>HPE Rack Ballast Kit</td>
				<td>276</td>
				<td>04-25-2015</td>
				<td>1</td>
				<td>GA</td>
				<td>09-25-2020</td>
				<td>Each</td>
			</tr>

		</tbody>
	</table>
</div>
</div>
</div>
<script>
function excelDownloadDocument()
{
	
	var radio=$("input[name=<portlet:namespace/>exampleRadios]:checked").val();
	console.log("///"+radio);
	
	var url = '${excelDownloadUrl}';
    location.href= url+"&<portlet:namespace/>download="+radio;
}
</script>

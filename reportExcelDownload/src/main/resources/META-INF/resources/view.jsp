<%@ include file="init.jsp"%>

<portlet:resourceURL id="/report/download" var="excelDownloadUrl" />
  
<body>

	<div class="card-body">
		<div class="row">
			<div class="col-3">
				<label>select the format to download:</label>
				<div>
					<div>
						<input class="form-check-input" type="radio" 
						        name="<portlet:namespace/>exampleRadios"
						    	value="excel"> <label
							    class="form-check-label col-4 label-black label-normal font12"
							for="exampleRadios2">MS Excel </label>
							<br/>
							<input class="form-check-input" type="radio" 
						        name="<portlet:namespace/>exampleRadios"
						    	value="xml"> <label
							    class="form-check-label col-4 label-black label-normal font12"
							for="exampleRadios2">XML </label>
							<br/>
						<input class="form-check-input" type="radio" 
						        name="<portlet:namespace/>exampleRadios"
						    	value="text"> <label
							    class="form-check-label col-4 label-black label-normal font12"
							for="exampleRadios2">Text </label> 

					</div>
					<div class="margin-top37">
						<button type="button" id="<portlet:namespace/>ExcelDownload" 
						name="<portlet:namespace/>ExcelDownload"
						onclick="excelDownloadDocument()"
							class="btn label-black inline-block label-bold "
							data-dismiss="modal">Download</button>
					</div>
				</div>


			</div>
		</div>
	</div>

	<table class="table table-striped" id="<portlet:namespace/>productTable"
	name="<portlet:namespace/>productTable">
		<thead>
			<tr>
				<th scope="col">Deal Id</th>
				<th scope="col">Customer Name</th>
				<th scope="col">DiscountType</th>
				<th scope="col">Price</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>120672-B21</td>
				<td>SH</td>
				<td>HPE Rack Ballast Kit</td>
				<td>459</td>
				
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>234672-B21</td>
				<td>SH</td>
				<td>HPE Rack Ballast Kit</td>
				<td>276</td>
				
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>234672-B21</td>
				<td>SH</td>
				<td>HPE Rack Ballast Kit</td>
				<td>276</td>
			</tr>

		</tbody>
	</table>
	
	<script>
	function excelDownloadDocument()
	{
		
		var radio=$("input[name=<portlet:namespace/>exampleRadios]:checked").val();
		console.log("///"+radio);
		var url = '${excelDownloadUrl}';
        location.href= url+"&<portlet:namespace/>exampleRadios="+radio;
	}
	</script>
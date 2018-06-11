<%@ include file="init.jsp"%>

<p>STANDARD Pricing</p>



<%
JSONObject obj= null;
	if (renderRequest != null) {
		obj = (JSONObject) renderRequest.getAttribute("reportValue");
	}
%>

<% if(obj != null)
{
%>
<aui:input name="savedReport" type="label" value="<%=obj.get("savedReports")%>" />
<aui:input name="standardReport" type="label" value="<%=obj.get("standardReports")%>" />

<%} %>















<!-- <body>
  <div id="accordion">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link float-right" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Collapse save option
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" data-parent="#accordion">
      <div class="card-body">
    <div class="row">
	<div class="col-3">
	<label>select the format to download:</label>
	 <div>
	 <div>
	        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2">
            <label class="form-check-label col-4 label-black label-normal font12" for="exampleRadios2">MS Excel
  </label>
  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2">
            <label class="form-check-label col-4 label-black label-normal font12" for="exampleRadios2">XML
  </label>
  </div>
  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2">
            <label class="form-check-label col-4 label-black label-normal font12" for="exampleRadios2">Plain text
  </label>
	</div>
	<div class="margin-top37">
	  <button type="button" class="btn label-black inline-block label-bold " data-dismiss="modal" >Download</button>
	</div>
	</div>
	<div class="col-3">
	<label class="label-bold">save and email report</label>
	<div class="border">
       <label class="font12 override-label label-black col-12">Name of report*</label>
	   <label class="font12 override-label label-grey">My Offerings</label>
    </div>
	<div class="border">
       <label class="font12 override-label label-grey col-12">email address(optional)</label>
	   <label class="font12 override-label label-grey">recipent@company.com</label>
    </div>
	</div>
	<div class="col-3">
	   <div class="form-check label-medium font-size14  label-white">
        <input class="form-check-input check-box margin-top0 li-between-spacing" type="checkbox" value="" id="defaultCheck1">
        <label class="form-check-label li-between-spacing" for="defaultCheck1">  ZIP file before emailing
     </label>
      </div>
	
	<div>
    <button class="label-medium label-white inline-block btncolor-green" >Submit</button>

  </div>
	</div>
	 
	</div>
	</div>
      </div>
    </div>
  </div>
  <div>
  <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Product Number</th>
      <th scope="col">PL</th>
      <th scope="col">Short description</th>
      <th scope="col">List price current</th>
	  <th scope="col">List price effective data</th>
	  <th scope="col">Qty break</th>
	   <th scope="col">PLC status</th>
	      <th scope="col">UOM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>120672-B21</td>
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
      <th scope="row">2</th>
      <td>234672-B21</td>
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
      <th scope="row">3</th>
      <td>234672-B21</td>
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
</body> -->
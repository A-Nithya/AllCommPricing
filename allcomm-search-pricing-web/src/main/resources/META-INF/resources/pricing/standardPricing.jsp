<%@page import="com.liferay.portal.kernel.json.JSONArray"%>
<%@ include file="init.jsp"%>

<portlet:resourceURL id="/report/download" var="excelDownloadUrl">
	<portlet:param name="download" value="excel" />
</portlet:resourceURL>

<portlet:renderURL var="reportRedirect">
	<portlet:param name="pageParam" value="reportPage.jsp"></portlet:param>
</portlet:renderURL>

<%
	JSONObject finalJsonObject = JSONFactoryUtil.createJSONObject();

	JSONArray countryJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject countryJsonObject1 = JSONFactoryUtil.createJSONObject();
	countryJsonObject1.put("id", "1");
	countryJsonObject1.put("countryName", "USA");
	countryJsonObject1.put("countryCode", "US");
	countryJsonArray.put(countryJsonObject1);

	JSONObject countryJsonObject2 = JSONFactoryUtil.createJSONObject();
	countryJsonObject2.put("id", "2");
	countryJsonObject2.put("countryName", "India");
	countryJsonObject2.put("countryCode", "IN");
	countryJsonArray.put(countryJsonObject2);

	JSONObject countryJsonObject3 = JSONFactoryUtil.createJSONObject();
	countryJsonObject3.put("id", "3");
	countryJsonObject3.put("countryName", "Brazil");
	countryJsonObject3.put("countryCode", "BR");
	countryJsonArray.put(countryJsonObject3);

	finalJsonObject.put("countryList", countryJsonArray);

	JSONArray contractListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject3 = JSONFactoryUtil.createJSONObject();
	jsonObject3.put("id", "1");
	jsonObject3.put("contractName", "R1BDY-BRAZIL PRICE LIST GENERIC AGREEMENT");
	contractListJsonArray.put(jsonObject3);

	JSONObject jsonObject4 = JSONFactoryUtil.createJSONObject();
	jsonObject4.put("id", "2");
	jsonObject4.put("contractName", "R1WJ1-ALDO COMPONENTES ELETRONICOS LTDA");
	contractListJsonArray.put(jsonObject4);

	JSONObject jsonObject5 = JSONFactoryUtil.createJSONObject();
	jsonObject5.put("id", "3");
	jsonObject5.put("contractName", "R1WJ3-DIGIGRAF DISTRIBUIDORA COM E SER SA");
	contractListJsonArray.put(jsonObject5);

	finalJsonObject.put("contractList", contractListJsonArray);

	JSONArray priceDescriptorJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject6 = JSONFactoryUtil.createJSONObject();
	jsonObject6.put("id", "1");
	jsonObject6.put("descriptorName", "BR-BRL-DDP");
	priceDescriptorJsonArray.put(jsonObject6);

	JSONObject jsonObject7 = JSONFactoryUtil.createJSONObject();
	jsonObject7.put("id", "2");
	jsonObject7.put("descriptorName", "BR-USD-DDP");
	priceDescriptorJsonArray.put(jsonObject7);

	JSONObject jsonObject8 = JSONFactoryUtil.createJSONObject();
	jsonObject8.put("id", "3");
	jsonObject8.put("descriptorName", "OO-USD-DDP");
	priceDescriptorJsonArray.put(jsonObject8);

	finalJsonObject.put("descriptorList", priceDescriptorJsonArray);

	JSONArray dateFilterJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject9 = JSONFactoryUtil.createJSONObject();
	jsonObject9.put("id", "1");
	jsonObject9.put("filterType", "none");
	dateFilterJsonArray.put(jsonObject9);

	JSONObject jsonObject10 = JSONFactoryUtil.createJSONObject();
	jsonObject10.put("id", "2");
	jsonObject10.put("filterType", "Effective");
	dateFilterJsonArray.put(jsonObject10);

	JSONObject jsonObject11 = JSONFactoryUtil.createJSONObject();
	jsonObject11.put("id", "3");
	jsonObject11.put("filterType", "Price Change");
	dateFilterJsonArray.put(jsonObject11);

	JSONObject jsonObject12 = JSONFactoryUtil.createJSONObject();
	jsonObject12.put("id", "4");
	jsonObject12.put("filterType", "PRS");
	dateFilterJsonArray.put(jsonObject12);

	finalJsonObject.put("dateFilterList", dateFilterJsonArray);

	JSONArray dateFormatJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject13 = JSONFactoryUtil.createJSONObject();
	jsonObject13.put("id", "1");
	jsonObject13.put("formatType", "yyyy-mm-dd");
	dateFormatJsonArray.put(jsonObject13);

	JSONObject jsonObject14 = JSONFactoryUtil.createJSONObject();
	jsonObject14.put("id", "2");
	jsonObject14.put("formatType", "yyyy/mm/dd");
	dateFormatJsonArray.put(jsonObject14);

	JSONObject jsonObject15 = JSONFactoryUtil.createJSONObject();
	jsonObject15.put("id", "3");
	jsonObject15.put("formatType", "yyyy mm dd");
	dateFormatJsonArray.put(jsonObject15);

	finalJsonObject.put("dateFormatList", dateFormatJsonArray);

	JSONArray productHierarchyJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject16 = JSONFactoryUtil.createJSONObject();
	jsonObject16.put("id", "1");
	jsonObject16.put("hierarchyType", "Product Line");
	productHierarchyJsonArray.put(jsonObject16);

	JSONObject jsonObject17 = JSONFactoryUtil.createJSONObject();
	jsonObject17.put("id", "2");
	jsonObject17.put("hierarchyType", "Family");
	productHierarchyJsonArray.put(jsonObject17);

	JSONObject jsonObject18 = JSONFactoryUtil.createJSONObject();
	jsonObject18.put("id", "3");
	jsonObject18.put("hierarchyType", "Series");
	productHierarchyJsonArray.put(jsonObject18);

	JSONObject jsonObject19 = JSONFactoryUtil.createJSONObject();
	jsonObject19.put("id", "4");
	jsonObject19.put("hierarchyType", "Model");
	productHierarchyJsonArray.put(jsonObject19);

	JSONObject jsonObject20 = JSONFactoryUtil.createJSONObject();
	jsonObject20.put("id", "5");
	jsonObject20.put("hierarchyType", "Category");
	productHierarchyJsonArray.put(jsonObject20);

	finalJsonObject.put("productHierarchy", productHierarchyJsonArray);

	JSONArray categoryListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject21 = JSONFactoryUtil.createJSONObject();
	jsonObject21.put("id", "1");
	jsonObject21.put("categoryName", "3D Services");
	categoryListJsonArray.put(jsonObject21);

	JSONObject jsonObject22 = JSONFactoryUtil.createJSONObject();
	jsonObject22.put("id", "2");
	jsonObject22.put("categoryName", "A4 Laser Accessories");
	categoryListJsonArray.put(jsonObject22);

	JSONObject jsonObject23 = JSONFactoryUtil.createJSONObject();
	jsonObject23.put("id", "3");
	jsonObject23.put("categoryName", "AiO Color Laser");
	categoryListJsonArray.put(jsonObject23);

	finalJsonObject.put("categoryList", categoryListJsonArray);

	JSONArray familyListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject24 = JSONFactoryUtil.createJSONObject();
	jsonObject24.put("id", "1");
	jsonObject24.put("familyName", "2c8a Easy Connect Solution");
	familyListJsonArray.put(jsonObject24);

	JSONObject jsonObject25 = JSONFactoryUtil.createJSONObject();
	jsonObject25.put("id", "2");
	jsonObject25.put("familyName", "AlphaServer");
	familyListJsonArray.put(jsonObject25);

	JSONObject jsonObject26 = JSONFactoryUtil.createJSONObject();
	jsonObject26.put("id", "3");
	jsonObject26.put("familyName", "BCS Appliances");
	familyListJsonArray.put(jsonObject26);

	finalJsonObject.put("familyList", familyListJsonArray);

	JSONArray productLineListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject27 = JSONFactoryUtil.createJSONObject();
	jsonObject27.put("id", "1");
	jsonObject27.put("productLine", "18 - Fortify License");
	productLineListJsonArray.put(jsonObject27);

	JSONObject jsonObject28 = JSONFactoryUtil.createJSONObject();
	jsonObject28.put("id", "2");
	jsonObject28.put("productLine", "1T- SW defined storage");
	productLineListJsonArray.put(jsonObject28);

	JSONObject jsonObject29 = JSONFactoryUtil.createJSONObject();
	jsonObject29.put("id", "3");
	jsonObject29.put("productLine", "1W - Apps SAAS");
	productLineListJsonArray.put(jsonObject29);

	finalJsonObject.put("productLineList", productLineListJsonArray);

	JSONArray modelListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject30 = JSONFactoryUtil.createJSONObject();
	jsonObject30.put("id", "1");
	jsonObject30.put("modelName", "10XXX Modular");
	modelListJsonArray.put(jsonObject30);

	JSONObject jsonObject31 = JSONFactoryUtil.createJSONObject();
	jsonObject31.put("id", "2");
	jsonObject31.put("modelName", "15 CRT Business Monitors");
	modelListJsonArray.put(jsonObject31);

	JSONObject jsonObject32 = JSONFactoryUtil.createJSONObject();
	jsonObject32.put("id", "3");
	jsonObject32.put("modelName", "15 Flat Panel Business Monitors");
	modelListJsonArray.put(jsonObject32);

	finalJsonObject.put("modelList", modelListJsonArray);

	JSONArray seriesListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject33 = JSONFactoryUtil.createJSONObject();
	jsonObject33.put("id", "1");
	jsonObject33.put("seriesName", "23J1-Blade Business Desktop - Accessories");
	seriesListJsonArray.put(jsonObject33);

	JSONObject jsonObject34 = JSONFactoryUtil.createJSONObject();
	jsonObject34.put("id", "2");
	jsonObject34.put("seriesName", "23J5-Blade Business Desktop PCs");
	seriesListJsonArray.put(jsonObject34);

	JSONObject jsonObject35 = JSONFactoryUtil.createJSONObject();
	jsonObject35.put("id", "3");
	jsonObject35.put("seriesName", "23J9-Business Desktop PCs - Accessories");
	seriesListJsonArray.put(jsonObject35);

	finalJsonObject.put("seriesList", seriesListJsonArray);

	JSONArray productStatusJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject36 = JSONFactoryUtil.createJSONObject();
	jsonObject36.put("id", "1");
	jsonObject36.put("statusName", "All PLC Statuses");
	productStatusJsonArray.put(jsonObject36);

	JSONObject jsonObject37 = JSONFactoryUtil.createJSONObject();
	jsonObject37.put("id", "2");
	jsonObject37.put("statusName", "SA Selective Availability");
	productStatusJsonArray.put(jsonObject37);

	JSONObject jsonObject38 = JSONFactoryUtil.createJSONObject();
	jsonObject38.put("id", "3");
	jsonObject38.put("statusName", "GA General Availability");
	productStatusJsonArray.put(jsonObject38);

	finalJsonObject.put("statusList", productStatusJsonArray);

	JSONArray productColumnListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject39 = JSONFactoryUtil.createJSONObject();
	jsonObject39.put("id", "1");
	jsonObject39.put("fieldName", "Category");
	productColumnListJsonArray.put(jsonObject39);

	JSONObject jsonObject40 = JSONFactoryUtil.createJSONObject();
	jsonObject40.put("id", "2");
	jsonObject40.put("fieldName", "product Line");
	productColumnListJsonArray.put(jsonObject40);

	JSONObject jsonObject41 = JSONFactoryUtil.createJSONObject();
	jsonObject41.put("id", "3");
	jsonObject41.put("fieldName", "Family ID");
	productColumnListJsonArray.put(jsonObject41);

	finalJsonObject.put("productColumnList", productColumnListJsonArray);

	JSONArray priceColumnListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject42 = JSONFactoryUtil.createJSONObject();
	jsonObject42.put("id", "1");
	jsonObject42.put("fieldName", "Current List Price");
	priceColumnListJsonArray.put(jsonObject42);

	JSONObject jsonObject43 = JSONFactoryUtil.createJSONObject();
	jsonObject43.put("id", "2");
	jsonObject43.put("fieldName", "Current Net Price");
	priceColumnListJsonArray.put(jsonObject43);

	JSONObject jsonObject44 = JSONFactoryUtil.createJSONObject();
	jsonObject44.put("id", "3");
	jsonObject44.put("fieldName", "PA Percentage Discount");
	priceColumnListJsonArray.put(jsonObject44);

	finalJsonObject.put("priceColumnList", priceColumnListJsonArray);

	JSONArray misColumnListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject45 = JSONFactoryUtil.createJSONObject();
	jsonObject45.put("id", "1");
	jsonObject45.put("fieldName", "Country Code");
	misColumnListJsonArray.put(jsonObject45);

	JSONObject jsonObject46 = JSONFactoryUtil.createJSONObject();
	jsonObject46.put("id", "2");
	jsonObject46.put("fieldName", "Partner Name");
	misColumnListJsonArray.put(jsonObject46);

	JSONObject jsonObject47 = JSONFactoryUtil.createJSONObject();
	jsonObject47.put("id", "3");
	jsonObject47.put("fieldName", "Purchace Agreement  Number");
	misColumnListJsonArray.put(jsonObject47);

	finalJsonObject.put("misColumnList", misColumnListJsonArray);

	JSONArray standardReportListJsonArray = JSONFactoryUtil.createJSONArray();

	JSONObject jsonObject48 = JSONFactoryUtil.createJSONObject();
	jsonObject48.put("id", "1");
	jsonObject48.put("reportName", "Daily Update(XLSX)");
	jsonObject48.put("isRemind", "0");
	standardReportListJsonArray.put(jsonObject48);

	JSONObject jsonObject49 = JSONFactoryUtil.createJSONObject();
	jsonObject49.put("id", "2");
	jsonObject49.put("reportName", "List Price(XLSX)");
	jsonObject49.put("isRemind", "1");
	standardReportListJsonArray.put(jsonObject49);

	JSONObject jsonObject50 = JSONFactoryUtil.createJSONObject();
	jsonObject50.put("id", "3");
	jsonObject50.put("reportName", "List Price(DAT)");
	jsonObject50.put("isRemind", "0");
	standardReportListJsonArray.put(jsonObject50);

	finalJsonObject.put("standardReportList", standardReportListJsonArray);

	renderRequest.setAttribute("finalJsonObject", finalJsonObject);
%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>PRICING</title>

<script>
$(document).ready(function () {

	  var selected_id = 'dummy';

	  var sel = $('.sel'),
	    txt = $('.txt'),
	    options = $('.options');

	  $(options).addClass('hide');

	  var final_var;

	  sel.click(function (e) {

	    $(options).removeClass('hide');

	    e.stopPropagation();
	  });

	  $('body').click(function (e) {
	    options.hide();
	  });

	  $('div').click(function (e) {

	    var Current_Div_Id = e.target.id;

	    if (selected_id != Current_Div_Id) {

	      var Click_Div_Id_Hide = '#' + selected_id + '_div';

	      $(Click_Div_Id_Hide).addClass('hide');

	      selected_id = Current_Div_Id;

	      var Current_Click_Div_Id = '#' + e.target.id + '_div';

	      console.log("entering div click id " + Current_Click_Div_Id);

	      $(Current_Click_Div_Id).show();
	    }
	  });
	  
	  options.children('div').click(function (e) {

	    e.stopPropagation();

	    var parent1 = $(this).parent().prev();

	    $(parent1).text($(this).text());
	    
	    var optionValue = $(this).text();
	    
	    console.log('parent 1 '+$(this).parent().prev().attr('id'));
	    
	    console.log('OPTION '+ optionValue);
	    
	    if ($(this).parent().prev().attr('id') == "prodhierarchy") {
	    	
	    	optionValue = optionValue.replace(/\s/g, '');
	    	
	    	var option_tag="#"+optionValue;
	    	
	    	$("#Category").addClass("hide");
	    	$("#Model").addClass("hide");
	    	$("#Series").addClass("hide");
	    	$("#Family").addClass("hide");
	    	$("#ProductLine").addClass("hide");
	    	
	    	$(option_tag).removeClass("hide");
	    } 

	    var final_var = "#" + $(this).parent().prev().attr('id') + '_final';

	    console.log("final " + final_var);

	    $(final_var).text($(this).text());
	    
	    $(this).addClass('selected').siblings('div').removeClass('selected');
	    
	    options.hide();
	  });
	  
	  $("#ProductLine").removeClass("hide");
	});
</script>

</head>

<body>
	<div class="tab-content" id="myTabContent">
		<div>

			<div class="content-inside-card">

				<div class="row">

					<div class="col-md-4">
						<h6 id="myLabel">Select Contract</h6>

						<ul class="contract-list">

							<li class="dropimage"><label class="inner-label">Select
									Country</label>

								<div class="sel">
									<div class='txt' id="country">Select Country</div>
									<div class="options" id="country_div">

										<%
											JSONObject finalObject = (JSONObject) request.getAttribute("finalJsonObject");

											JSONArray countryArray = finalObject.getJSONArray("countryList");

											for (int i = 0; i < countryArray.length(); i++) {

												JSONObject jsonObject = countryArray.getJSONObject(i);
										%>

										<div><%=jsonObject.get("countryName")%></div>

										<%
											}
										%>

									</div>

									<p id="country_final" class="hide">final</p>
								</div></li>

							<li style="border-top: 0px" class="dropimage"><label
								class="inner-label">Contract</label>

								<div class="sel">
									<div class='txt' id="contract">Select Contract</div>
									<div class="options" id="contract_div">

										<%
											JSONArray contractArray = finalObject.getJSONArray("contractList");

											for (int i = 0; i < contractArray.length(); i++) {

												JSONObject jsonObject = contractArray.getJSONObject(i);
										%>

										<div><%=jsonObject.get("contractName")%></div>

										<%
											}
										%>

									</div>

									<p id="contract_final" class="hide">final</p>
								</div></li>
							<li style="border-top: 0px" class="dropimage"><label
								class="inner-label">Price Descriptor</label>

								<div class="sel">
									<div class='txt' id="price">Select Price Descriptor</div>
									<div class="options" id="price_div">

										<%
											JSONArray descriptorArray = finalObject.getJSONArray("descriptorList");

											for (int i = 0; i < descriptorArray.length(); i++) {

												JSONObject jsonObject = descriptorArray.getJSONObject(i);
										%>

										<div><%=jsonObject.get("descriptorName")%></div>

										<%
											}
										%>

									</div>

									<p id="price_final" class="hide">final</p>
								</div></li>
							<li style="border-top: 0px">

								<div class="row">

									<div class="col-md-6" class="dropimage">

										<label class="inner-label">Date Filter</label>

										<div class="sel">
											<div class='txt' id="datefilter">Select Date Filter</div>
											<div class="options" id="datefilter_div">

												<%
													JSONArray dateFilterArray = finalObject.getJSONArray("dateFilterList");

													for (int i = 0; i < dateFilterArray.length(); i++) {

														JSONObject jsonObject = dateFilterArray.getJSONObject(i);
												%>

												<div><%=jsonObject.get("filterType")%></div>

												<%
													}
												%>

											</div>

											<p id="datefilter_final"  class="hide">final</p>
										</div>

									</div>

									<div class="col-md-6" style="border-left: 1px solid #ececec"
										class="dropimage">

										<label class="inner-label">Date Filter</label>

										<div class="sel">
											<div class='txt' id="dateformat">Select Date Format</div>
											<div class="options" id="dateformat_div">

												<%
													JSONArray dateFormatArray = finalObject.getJSONArray("dateFormatList");

													for (int i = 0; i < dateFormatArray.length(); i++) {

														JSONObject jsonObject = dateFormatArray.getJSONObject(i);
												%>

												<div><%=jsonObject.get("formatType")%></div>

												<%
													}
												%>

											</div>

											<p id="dateformat_final"  class="hide">final</p>
										</div>

									</div>

								</div>
							</li>

							<li style="border-top: 0px;">

								<div class="row">

									<div class="col-md-6  calender-image">

										<label class="inner-label">Price Change From</label>

										<div class="dropdown">
											<button class="btn  dropdown-toggle" type="button"
												id="dropdownMenuButton" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">
												04-01-2018</button>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Usa</a> <a
													class="dropdown-item" href="#">India</a> <a
													class="dropdown-item" href="#">America</a>
											</div>
										</div>

									</div>

									<div class="col-md-6  calender-image"
										style="border-left: 1px solid #ececec">

										<label class="inner-label">Price Change To</label>

										<div class="dropdown">
											<button class="btn  dropdown-toggle" type="button"
												id="dropdownMenuButton" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">
												04-01-2018</button>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Usa</a> <a
													class="dropdown-item" href="#">India</a> <a
													class="dropdown-item" href="#">America</a>
											</div>
										</div>

									</div>

								</div>

							</li>
						</ul>

					</div>

					<div class="col-md-8">

						<div class="row">

							<div class="col-md-6">

								<h6 id="myLabel">Search product by</h6>

								<div class="search-product seachImage">
									<label class="inner-label" style="margin-top: 3px;">Part
										Number(s)</label> <input type="search"
										placeholder="7779168B21,E6U64ABE" />
								</div>

								<div class="radioboxes-search">

									<ul class="radio-box-list">
										<li><label class="container-radiobox"> <span
												class="labell">As Entered</span> <input type="radio"
												checked="checked" name="radio"> <span
												class="checkmark "></span>
										</label></li>
										<li><label class="container-radiobox"> <span
												class="labell">Show All Options</span> <input type="radio"
												name="radio"> <span class="checkmark nonactive"></span>
										</label></li>
										<li><label class="container-radiobox"> <span
												class="labell">Prod Desc(Use Wild Card*)</span> <input
												type="radio" name="radio"> <span
												class="checkmark nonactive"></span>
										</label></li>
									</ul>

								</div>

							</div>

							<div class="col-md-6">

								<ul class="contract-list" style="margin-top: 27px">

									<li class="dropimage"><label class="inner-label">Product
											Hierarchy</label>
										<div class="sel">
											<div class='txt' id="prodhierarchy">Product Line</div>
											<div class="options" id="prodhierarchy_div">

												<%
													JSONArray prodHierarchyArray = finalObject.getJSONArray("productHierarchy");

													for (int i = 0; i < prodHierarchyArray.length(); i++) {

														JSONObject jsonObject = prodHierarchyArray.getJSONObject(i);
												%>

												<div><%=jsonObject.get("hierarchyType")%></div>

												<%
													}
													
								
												%>

											</div>

											<p id="prodhierarchy_final"  class="hide">final</p>
										</div></li>

									<li style="border-top: 0px;" class="list_inside ">

										<div id="ProductLine" class="hide">
											<ul class="inner-list-line">

												<%
													JSONArray productLineArray = finalObject.getJSONArray("productLineList");

													for (int i = 0; i < productLineArray.length(); i++) {

														JSONObject jsonObject = productLineArray.getJSONObject(i);
												%>

												<li><%=jsonObject.get("productLine")%></li>

												<%
													}
												%>

											</ul>
										</div>

										<div id="Family" class="hide">
											<ul class="inner-list-line">

												<%
													JSONArray familyArray = finalObject.getJSONArray("familyList");

													for (int i = 0; i < familyArray.length(); i++) {

														JSONObject jsonObject = familyArray.getJSONObject(i);
												%>

												<li><%=jsonObject.get("familyName")%></li>

												<%
													}
												%>

											</ul>
										</div>

										<div id="Model" class="hide">
											<ul class="inner-list-line">

												<%
													JSONArray modelArray = finalObject.getJSONArray("modelList");

													for (int i = 0; i < modelArray.length(); i++) {

														JSONObject jsonObject = modelArray.getJSONObject(i);
												%>

												<li><%=jsonObject.get("modelName")%></li>

												<%
													}
												%>

											</ul>
										</div>

										<div id="Category" class="hide">
											<ul class="inner-list-line">

												<%
													JSONArray categoryArray = finalObject.getJSONArray("categoryList");

													for (int i = 0; i < categoryArray.length(); i++) {

														JSONObject jsonObject = categoryArray.getJSONObject(i);
												%>

												<li><%=jsonObject.get("categoryName")%></li>

												<%
													}
												%>

											</ul>
										</div>

										<div id="Series" class="hide">
											<ul class="inner-list-line">

												<%
													JSONArray seriesArray = finalObject.getJSONArray("seriesList");

													for (int i = 0; i < seriesArray.length(); i++) {

														JSONObject jsonObject = seriesArray.getJSONObject(i);
												%>

												<li><%=jsonObject.get("seriesName")%></li>

												<%
													}
												%>

											</ul>
										</div>


									</li>

									<li style="border-top: 0px" class="dropimage"><label
										class="inner-label">Product Life Cycle Status</label>

										<div class="sel">
											<div class='txt' id="prodStatus">Select Life Cycle
												Status</div>
											<div class="options" id="prodStatus_div">

												<%
													JSONArray productStatusArray = finalObject.getJSONArray("statusList");

													for (int i = 0; i < productStatusArray.length(); i++) {

														JSONObject jsonObject = productStatusArray.getJSONObject(i);
												%>

												<div><%=jsonObject.get("statusName")%></div>

												<%
													}
												%>

											</div>

											<p id="prodStatus_final"  class="hide">final</p>
										</div></li>
								</ul>

							</div>

						</div>

						<div class="generatereport">
							<hr>
							<button type="button" id="genBtn">
								<a href="<%=reportRedirect%>">Generate Report</a>
							</button>
						</div>

					</div>

				</div>

				<div class="row">

					<div class="col-md-4">

						<div class="card mycard">
							<div class="card-body">

								<div class="standardReports">
									<label class="report-label calender-image">Standard
										Reports</label>
									<hr style="margin-top: 0px">

									<ul class="report-links">

										<%
											JSONArray standardReportArray = finalObject.getJSONArray("standardReportList");

											for (int i = 0; i < standardReportArray.length(); i++) {

												JSONObject jsonObject = standardReportArray.getJSONObject(i);
										%>

										<li class="calender-image"><a href="${excelDownloadUrl}"><%=jsonObject.get("reportName")%></a></li>

										<%
											}
										%>
									</ul>
								</div>

								<div class="savedReports">
									<label class="report-label calender-image">Saved
										Reports</label>
									<hr style="margin-top: 0px">

									<ul class="report-links">
										<li class="calender-image"><a href="#">Networking
												Software(US-UD-DDP)</a></li>
										<li class="edit-image "><a href="#">Hybrid
												IT(2UMXR-US-UD-DDP)</a></li>
										<li class="edit-image "><a href="#">IPG-LES(2UMXR-US-UD-DDP)</a>
										</li>
										<li class="calender-image"><a href="#">My
												Offering(2UMXR-US-UD-DDP)</a></li>
										<li class="edit-image "><a href="#">Apha
												Server(2UMXR-US-UD-DDP)</a></li>
										<li class="calender-image"><a href="#">Software
												Services(2UMXR-US-UD-DDP)</a></li>
										<li class="edit-image "><a href="#">Nimber Storage
												Services(2UMXR-US-UD-DDP)</a></li>
									</ul>
								</div>

							</div>
						</div>

					</div>

					<div class="col-md-8">

						<div class="savedReportsOptional">

							<label id="myLabel">Saved Reports Optional</label>
							<hr style="margin-top: 0px">
							<small
								style="font-weight: 700; font-size: 13px; margin-bottom: 10px">Select
								Report Columns</small>

							<div class="row" style="margin-top: 10px">

								<div class="col-md-6">

									<div class="outer-report">

										<span style="padding-left: 5px; font-size: 10px; color: #666">Product
											Information</span>

										<div class="inner-report-scroll">

											<ul class="inner-report-list">

												<%
													JSONArray productColumnArray = finalObject.getJSONArray("productColumnList");

													for (int i = 0; i < productColumnArray.length(); i++) {

														JSONObject jsonObject = productColumnArray.getJSONObject(i);
												%>

												<li class="selected"><%=jsonObject.get("fieldName")%></li>

												<%
													}
												%>

											</ul>

										</div>

									</div>

								</div>

								<div class="col-md-6">

									<div class="outer-report">

										<span style="padding-left: 5px; font-size: 10px; color: #666">Price</span>

										<div class="inner-report-scroll">

											<ul class="inner-report-list">
												<%
													JSONArray priceColumnArray = finalObject.getJSONArray("priceColumnList");

													for (int i = 0; i < priceColumnArray.length(); i++) {

														JSONObject jsonObject = priceColumnArray.getJSONObject(i);
												%>

												<li class="selected"><%=jsonObject.get("fieldName")%></li>

												<%
													}
												%>

											</ul>

										</div>

									</div>

								</div>

								<div class="col-md-6" style="margin-top: 20px">

									<div class="outer-report">

										<span style="padding-left: 5px; font-size: 10px; color: #666">Miscellaneous</span>

										<div class="inner-report-scroll">

											<ul class="inner-report-list">
												<%
													JSONArray misColumnArray = finalObject.getJSONArray("misColumnList");

													for (int i = 0; i < misColumnArray.length(); i++) {

														JSONObject jsonObject = misColumnArray.getJSONObject(i);
												%>

												<li class="selected"><%=jsonObject.get("fieldName")%></li>

												<%
													}
												%>

											</ul>

										</div>

									</div>

								</div>

								<div class="col-md-6" style="margin-top: 20px; font-size: 10px">
									<span> <strong>Note</strong> Part Number , short
										description and product lines / hiechary will be displayed by
										default in all results
									</span> <label class="container-radiobox" style="margin-top: 15px">
										<span
										style="display: block; margin-bottom: 4px; font-size: 12px"
										class="labell">Preferred Order Quantity</span> <small
										style="font-size: 9px; color: #666">Selec this only
											when your PCQ is 1</small> <input type="radio" checked="checked"
										name="radio"> <span class="checkmark "
										style="border-radius: 0px"></span>
									</label>

								</div>

							</div>

						</div>

						<div class="generatereportother">
							<hr>
							<button type="button" id="genBtnBlack">Generate Report</button>
						</div>

					</div>

				</div>

			</div>

		</div>
		<div class="tab-pane fade" id="specialPricing" role="tabpanel"
			aria-labelledby="specialPricing-tab">

			<div class="row ">

				<div class="col-md-4 paddingbottom20">

					<div class="search-product seachImage">
						<label class="inner-label" style="margin-top: 3px;">Search</label>
						<input type="search" placeholder="PN,PL or model PIN" />
					</div>

					<div class="saved-reports">

						<div class="dropdown dropDown">
							<button class="btn  dropdown-toggle reportBtnn dropimage"
								style="border-top: 0px" type="button" id="dropdownMenuButton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Saved Reports</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="#">Usa</a> <a
									class="dropdown-item" href="#">India</a> <a
									class="dropdown-item" href="#">America</a>
							</div>
						</div>

					</div>

					<div class="col-md-4"></div>

					<div class="col-md-4"></div>

				</div>

			</div>

			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">...</div>
		</div>

	</div>
	<script>
	$("#genBtn").click(function(e){
	      e.preventDefault();
	      $.ajax({
	        ...
	        beforeSend : function(xhr, opts){
	        	$(this).html('<img src="icon-loading.gif" />'); //show loading gif
	        },
	        success: function(){

	        },
	        complete : function() {
	           //remove loading gif
	        }
	    });
	});
	
	</script>

</body>
</html>

<%@ include file="init.jsp" %>

<p>
	<b><liferay-ui:message key="emailNotification.caption"/></b>
</p>


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

    renderRequest.setAttribute("finalJsonObject", finalJsonObject);
%>


<li class="dropimage"><label class="inner-label">Select
                                    Country</label>
                                <div class="dropdown">
                                    <button class="btn  dropdown-toggle" type="button"
                                        id="dropdownMenuButton" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">United
                                        States</button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#">Usa</a> <a
                                            class="dropdown-item" href="#">India</a> <a
                                            class="dropdown-item" href="#">America</a>
                                    </div>

                                </div> 
                                <aui:select name="Books">
                                    <%
                                        JSONObject jsObject = (JSONObject) request.getAttribute("finalJsonObject");

                                            JSONArray jsArray = jsObject.getJSONArray("countryList");
      
                                            for (int i= 0; i < jsArray.length(); i++) {
                                            	JSONObject counJsonObject= jsArray.getJSONObject(i);
                                           
                                    %>
                                    <aui:option value="<%=counJsonObject.get("id")%>">
                                        <%=counJsonObject.get("countryName")%>
                                    </aui:option>
                                    <%
                                        }
                                    %>
                                </aui:select></li>


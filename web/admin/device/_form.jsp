<%@ page import="db.CompaniesEntity" %>
<%@ page import="db.DevicesEntity" %>
<%@ page import="manager.CompanyManager" %>
<%@ page import="manager.DeviceManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>

<%
    int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<DevicesEntity> manager = new DeviceManager();
    final CompanyManager companyManager = new CompanyManager();

    DevicesEntity entity = null;

    if (id > 0) {

        //edit
        if (request.getMethod().equalsIgnoreCase("get")) {
            entity = manager.get(id);
        } else if (request.getMethod().equalsIgnoreCase("post")) {
            entity = manager.get(id);

            entity.setBrand(request.getParameter("brand"));
            entity.setModel(request.getParameter("model"));
            entity.setToken(request.getParameter("token"));
            entity.setCompanyKey(request.getParameter("company_key"));
            entity.setUniqueId(request.getParameter("unique_id"));

            if (manager.update(id, entity)) {
                pageContext.forward("view.jsp?id=" + id);
            }
        }
    } else {

        //create
        if (request.getMethod().equalsIgnoreCase("get")) {
            entity = new DevicesEntity();
        } else if (request.getMethod().equalsIgnoreCase("post")) {
            entity = new DevicesEntity();

            entity.setBrand(request.getParameter("brand"));
            entity.setModel(request.getParameter("model"));
            entity.setToken(request.getParameter("token"));
            entity.setCompanyKey(request.getParameter("company_key"));
            entity.setUniqueId(request.getParameter("unique_id"));

            id = manager.insert(entity);

            if (id > 0) {
                pageContext.forward("view.jsp?id=" + id);
            }
        }
    }

%>

<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 9/18/2015
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-horizontal" id="form1" method="post" accept-charset="utf-8" novalidate="novalidate">

    <div class="form-group ">
        <label for="c_brand" class="control-label col-lg-2">Brand <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_brand" name="brand" value="<%=entity.getBrand()%>"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_model" class="control-label col-lg-2">Model <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_model" name="model" value="<%=entity.getModel()%>"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_token" class="control-label col-lg-2">Token <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_token" name="token" value="<%=entity.getToken()%>"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_company_key" class="control-label col-lg-2">Company Key <span class="required">*</span></label>

        <div class="col-lg-10">
            <select class="select2-control form-control" name="company_key" id="c_company_key">
                <%
                    for (CompaniesEntity company : companyManager.getAll(0, 0)) {

                        final boolean isSelected = entity.getCompanyKey() != null &&
                                company.getKey().equalsIgnoreCase(entity.getCompanyKey());

                %>
                <%if (isSelected) {%>
                <option value="<%=company.getKey()%>" selected="selected"><%=company.getName()%>
                </option>
                <%
                } else {
                %>
                <option value="<%=company.getKey()%>"><%=company.getName()%>
                </option>
                <%
                    }%>
                <%}%>
            </select>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_unique_id" class="control-label col-lg-2">Unique Id <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_unique_id" name="unique_id" value="<%=entity.getUniqueId()%>"
                   type="text"
                   required="required"/>
        </div>
    </div>

</form>

<br/>
<br/>

<jsp:include page="/partials/form_bar.jsp">
    <jsp:param name="id" value="<%=id%>"/>
</jsp:include>

<%@ page import="db.CompaniesEntity" %>
<%@ page import="db.ProductsEntity" %>
<%@ page import="manager.CompanyManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.ProductManager" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>

<%
    int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<ProductsEntity> manager = new ProductManager();
    final CompanyManager companyManager = new CompanyManager();

    ProductsEntity entity = null;

    if (id > 0) {

        //edit
        if (request.getMethod().equalsIgnoreCase("get")) {
            entity = manager.get(id);
        } else if (request.getMethod().equalsIgnoreCase("post")) {
            entity = manager.get(id);

            entity.setName(request.getParameter("name"));
            entity.setDescription(request.getParameter("description"));
            entity.setPhotoUrl(request.getParameter("photo_url"));
            entity.setMark((Integer) new IntegerConverter(0).convert(String.class, request.getParameter("mark")));
            entity.setCompanyId((Integer) new IntegerConverter(0).convert(String.class, request.getParameter("company_id")));

            if (manager.update(id, entity)) {
                pageContext.forward("view.jsp?id=" + id);
            }
        }
    } else {

        //create
        if (request.getMethod().equalsIgnoreCase("get")) {
            entity = new ProductsEntity();
        } else if (request.getMethod().equalsIgnoreCase("post")) {
            entity = new ProductsEntity();

            entity.setName(request.getParameter("name"));
            entity.setDescription(request.getParameter("description"));
            entity.setPhotoUrl(request.getParameter("photo_url"));
            entity.setMark((Integer) new IntegerConverter(0).convert(String.class, request.getParameter("mark")));
            entity.setCompanyId((Integer) new IntegerConverter(0).convert(String.class, request.getParameter("company_id")));

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
        <label for="c_name" class="control-label col-lg-2">Name <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_name" name="name" value="<%=entity.getName()%>"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_photo_url" class="control-label col-lg-2">Photo Url <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_photo_url" name="photo_url" value="<%=entity.getPhotoUrl()%>"
                   type="url"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_mark" class="control-label col-lg-2">Mark <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_mark" name="photo_url" value="<%=entity.getMark()%>"
                   type="number"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_company_id" class="control-label col-lg-2">Company Id <span class="required">*</span></label>

        <div class="col-lg-10">
            <select class="select2-control form-control" name="company_id" id="c_company_id">
                <%
                    for (CompaniesEntity company : companyManager.getAll(0, 0)) {

                        final boolean isSelected = entity.getCompanyId() > 0 &&
                                company.getId() == entity.getCompanyId();

                %>
                <%if (isSelected) {%>
                <option value="<%=company.getId()%>" selected="selected"><%=company.getName()%>
                </option>
                <%
                } else {
                %>
                <option value="<%=company.getId()%>"><%=company.getName()%>
                </option>
                <%
                    }%>
                <%}%>
            </select>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_description" class="control-label col-lg-2">Description <span class="required">*</span></label>

        <div class="col-lg-10">
            <textarea class="form-control" id="c_description" name="description"
                      required="required"><%=entity.getDescription()%></textarea>
        </div>
    </div>

</form>

<br/>
<br/>

<jsp:include page="/partials/form_bar.jsp">
    <jsp:param name="id" value="<%=id%>"/>
</jsp:include>

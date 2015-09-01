<%@ page import="db.CompaniesEntity" %>
<%@ page import="manager.CompanyManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="models.PagingResponseModel" %>

<%
    final ManagerImpl<CompaniesEntity> manager = new CompanyManager();
    final PagingResponseModel<CompaniesEntity> model = new PagingResponseModel<>(manager, request.getParameter("page"), request.getParameter("size"));

    request.setAttribute("pager", model);
%>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/22/2015
  Time: 11:24 PM
  To change this template use File | helpers.FactoryHelper | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table class="table table-responsible" id="dataTable">

    <thead>
    <tr>
        <th>#</th>
        <th>Name</th>
        <th>Key</th>
        <th>Currency</th>
        <th>Logo</th>
        <th>Site</th>
        <th>Phone</th>
        <th></th>
    </tr>
    </thead>

    <tbody>
    <%for (CompaniesEntity item : model.getItems()) {%>
    <tr>
        <td><%=item.getId()%>
        </td>
        <td><%=item.getName()%>
        </td>
        <td><%=item.getKey()%>
        </td>
        <td><%=item.getCurrency()%>
        </td>
        <td>
            <img src=" <%=item.getLogoUrl()%>" width="40" height="30"/>
        </td>
        <td>
            <a href="<%=item.getSiteUrl()%>" target="_blank" class="btn btn-link">
                <%=item.getAbout()%>
            </a>
        </td>
        <td><%=item.getPhone()%>
        </td>
        <td>
            <p>
                <a class="btn btn-default" href="./view.jsp?id=<%=item.getId()%>"><i
                        class="glyphicon glyphicon-eye-open"></i> View</a>
                <a class="btn btn-primary" href="./edit.jsp?id=<%=item.getId()%>"><i
                        class="glyphicon glyphicon-pencil"></i> Edit</a>
                <a class="btn btn-danger" href="./delete.jsp?id=<%=item.getId()%>"><i
                        class="glyphicon glyphicon-remove"></i> Delete</a>
            </p>
        </td>
    </tr>
    <%}%>
    </tbody>

</table>

<jsp:include page="./../../partials/pager.jsp"/>
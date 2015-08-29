<%@ page import="db.CompaniesEntity" %>
<%@ page import="manager.CompanyManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="java.util.List" %>

<%
    ManagerImpl<CompaniesEntity> manager = new CompanyManager();
    List<CompaniesEntity> list = manager.getAll(0, 0);
%>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/22/2015
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
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
    </tr>
    </thead>
    <tbody>
    <%for (CompaniesEntity item : list) {%>
    <tr>
        <td>
            <a href="#<%=item.getId()%>" class="btn btn-default">
                View
            </a>
            <a href="#<%=item.getId()%>" class="btn btn-success">
                Edit
            </a>
            <a href="#<%=item.getId()%>" class="btn btn-danger">
                Delete
            </a>
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
    </tr>
    <%}%>
    </tbody>
</table>
<%@ page import="db.DevicesEntity" %>
<%@ page import="manager.DeviceManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="java.util.List" %>
<%
    ManagerImpl<DevicesEntity> manager = new DeviceManager();
    List<DevicesEntity> list = manager.getAll(0, 0);
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
        <th>Brand</th>
        <th>Model</th>
        <th>Token</th>
        <th>Company Key</th>
        <th>Unique Id</th>
    </tr>
    </thead>
    <tbody>
    <%for (DevicesEntity item : list) {%>
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
        <td><%=item.getBrand()%>
        </td>
        <td><%=item.getModel()%>
        </td>
        <td><%=item.getToken()%>
        </td>
        <td><%=item.getCompanyKey()%>
        </td>
        <td><%=item.getUniqueId()%>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
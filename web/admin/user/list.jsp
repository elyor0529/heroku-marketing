<%@ page import="db.UsersEntity" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.UserManager" %>
<%@ page import="java.util.List" %>
<%
    ManagerImpl<UsersEntity> manager = new UserManager();
    List<UsersEntity> list = manager.getAll(0, 0);
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
        <th>Full Name</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Birthday</th>
        <th>Promotional code</th>
        <th>Device Id</th>
    </tr>
    </thead>
    <tbody>
    <%for (UsersEntity item : list) {%>
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
        <td><%=item.getFullName()%>
        </td>
        <td><%=item.getEmail()%>
        </td>
        <td><%=item.getGender()%>
        </td>
        <td><%=item.getBirthday()%>
        </td>
        <td><%=item.getPromotionalCode()%>
        </td>
        <td><%=item.getDeviceId()%>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
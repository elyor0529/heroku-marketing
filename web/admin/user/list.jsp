<%@ page import="db.UsersEntity" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.UserManager" %>
<%@ page import="models.PagingResponseModel" %>
<%
    final ManagerImpl<UsersEntity> manager = new UserManager();
    final PagingResponseModel<UsersEntity> model = new PagingResponseModel<>(manager, request.getParameter("page"), request.getParameter("size"));

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
        <th>Full Name</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Birthday</th>
        <th>Promotional code</th>
        <th>Device Id</th>
        <th></th>
    </tr>
    </thead>

    <tbody>
    <%for (UsersEntity item : model.getItems()) {%>
    <tr>
        <td><%=item.getId()%>
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
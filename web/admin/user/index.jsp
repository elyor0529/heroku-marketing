<%@ page import="db.UsersEntity" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.UserManager" %>
<%@ page import="models.PaginationResponseModel" %>
<%
    final ManagerImpl<UsersEntity> manager = new UserManager();
    final PaginationResponseModel<UsersEntity> model = new PaginationResponseModel<>(manager, request.getParameter("page"), request.getParameter("size"));

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
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/partials/header.jsp"/>
    <title>Marketing | User</title>
</head>

<body>

<div class="container">

    <!-- The justified navigation menu is meant for single line per list item.
          Multiple lines will require custom code not provided by Bootstrap. -->
    <jsp:include page="/partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1>User</h1>
    </div>

    <p class="lead">Put content here</p>


    <div class="row">

        <p>
            <a href="create.jsp" class="btn btn-primary">
                Create
            </a>
        </p>

        <table class="table table-responsible">

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
                    <jsp:include page="/partials/action.jsp">
                        <jsp:param name="id" value="<%=item.getId()%>"/>
                    </jsp:include>
                </td>
            </tr>
            <%}%>
            </tbody>

        </table>

        <jsp:include page="/partials/pager.jsp"/>

    </div>
</div>
<jsp:include page="/partials/footer.jsp"/>
<script src="/assets/js/main.js"></script>

</body>
</html>

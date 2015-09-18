<%@ page import="db.DevicesEntity" %>
<%@ page import="manager.DeviceManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="models.PaginationResponseModel" %>
<%
    final ManagerImpl<DevicesEntity> manager = new DeviceManager();
    final PaginationResponseModel<DevicesEntity> model = new PaginationResponseModel<>(manager, request.getParameter("page"), request.getParameter("size"));

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
    <title>Marketing | Device</title>
</head>

<body>
<div class="container">

    <!-- The justified navigation menu is meant for single line per list item.
          Multiple lines will require custom code not provided by Bootstrap. -->
    <jsp:include page="/partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1>Device</h1>
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
                <th>Brand</th>
                <th>Model</th>
                <th>Token</th>
                <th>Company Key</th>
                <th>Unique Id</th>
                <th></th>
            </tr>
            </thead>

            <tbody>
            <%for (DevicesEntity item : model.getItems()) {%>
            <tr>
                <td><%=item.getId()%>
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

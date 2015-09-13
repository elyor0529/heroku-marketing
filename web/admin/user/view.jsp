<%@ page import="db.UsersEntity" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.UserManager" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>

<%
    final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<UsersEntity> manager = new UserManager();
    final UsersEntity entity = manager.get(id);
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
    <title>Marketing | <%=entity.getFullName()%>
    </title>
</head>

<body>

<div class="container">

    <!-- The justified navigation menu is meant for single line per list item.
          Multiple lines will require custom code not provided by Bootstrap. -->
    <jsp:include page="/partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1><%=entity.getFullName()%>
        </h1>
    </div>

    <table class="table table-responsible table-view">

        <tr>
            <th>E-mail</th>
            <td><%=entity.getEmail()%>
            </td>
        </tr>

        <tr>
            <th>Device Id</th>
            <td><%=entity.getDeviceId()%>
            </td>
        </tr>

        <tr>
            <th>Birthday</th>
            <td><%=entity.getBirthday()%>
            </td>
        </tr>

        <tr>
            <th>Gender</th>
            <td><%=entity.getGender()%>
            </td>
        </tr>

        <tr>
            <th>Promotional Code</th>
            <td><%=entity.getPromotionalCode()%>
            </td>
        </tr>

    </table>

    <jsp:include page="/partials/view_bar.jsp">
        <jsp:param name="id" value="<%=entity.getId()%>"/>
    </jsp:include>

</div>
<jsp:include page="/partials/footer.jsp"/>
<script src="/assets/js/main.js"></script>
</body>
</html>

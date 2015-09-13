<%@ page import="db.DevicesEntity" %>
<%@ page import="manager.DeviceManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>

<%
    final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<DevicesEntity> manager = new DeviceManager();
    final DevicesEntity entity = manager.get(id);
    final String name = entity.getBrand() + " - " + entity.getModel();
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
    <title>Marketing | <%=name%>
    </title>
</head>

<body>

<div class="container">

    <!-- The justified navigation menu is meant for single line per list item.
          Multiple lines will require custom code not provided by Bootstrap. -->
    <jsp:include page="/partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1><%=name%>
        </h1>
    </div>

    <table class="table table-responsible table-view">

        <tr>
            <th>Token</th>
            <td><%=entity.getToken()%>
            </td>
        </tr>

        <tr>
            <th>Company Key</th>
            <td><%=entity.getCompanyKey()%>
            </td>
        </tr>

        <tr>
            <th>Unique ID</th>
            <td><%=entity.getUniqueId()%>
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

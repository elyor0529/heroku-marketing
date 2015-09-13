<%@ page import="db.ProductsEntity" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.ProductManager" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>

<%
    final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<ProductsEntity> manager = new ProductManager();
    final ProductsEntity entity = manager.get(id);
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
    <title>Marketing | <%=entity.getName()%>
    </title>
</head>

<body>

<div class="container">

    <!-- The justified navigation menu is meant for single line per list item.
          Multiple lines will require custom code not provided by Bootstrap. -->
    <jsp:include page="/partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1><%=entity.getName()%>
        </h1>
    </div>

    <p class="lead">
        <%=entity.getDescription()%>
    </p>

    <table class="table table-responsible table-view">

        <tr>
            <th>Mark</th>
            <td><%=entity.getMark()%>
            </td>
        </tr>

        <tr>
            <th>Company Id</th>
            <td><%=entity.getCompanyId()%>
            </td>
        </tr>

        <tr>
            <th>Photo URL</th>
            <td>
                <img src="<%=entity.getPhotoUrl()%>" width="40" height="30"/>
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

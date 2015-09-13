<%@ page import="db.ProductsEntity" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.ProductManager" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 9/2/2015
  Time: 2:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<ProductsEntity> manager = new ProductManager();

    if (manager.delete(id)) {
        response.sendRedirect("index.jsp");
    }
%>
<html>
<head>
    <title></title>
</head>
<body>
</body>
</html>

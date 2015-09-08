<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 9/2/2015
  Time: 2:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
%>
<p>
    <a class="btn btn-default" href="view.jsp?id=<%=id%>"><i
            class="glyphicon glyphicon-eye-open"></i> View</a>
    <a class="btn btn-primary" href="edit.jsp?id=<%=id%>"><i
            class="glyphicon glyphicon-pencil"></i> Edit</a>
    <a class="btn btn-danger" href="delete.jsp?id=<%=id%>"><i
            class="glyphicon glyphicon-remove"></i> Delete</a>
</p>
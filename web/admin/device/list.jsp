<%@ page import="db.DevicesEntity" %>
<%@ page import="manager.DeviceManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="models.PagingResponseModel" %>
<%
    final ManagerImpl<DevicesEntity> manager = new DeviceManager();
    final PagingResponseModel<DevicesEntity> model = new PagingResponseModel<>(manager, request.getParameter("page"), request.getParameter("size"));

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
<%@ page import="db.NewsEntity" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.NewsManager" %>
<%@ page import="java.util.List" %>
<%
    ManagerImpl<NewsEntity> manager = new NewsManager();
    List<NewsEntity> list = manager.getAll(0, 0);
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
        <th>Title</th>
        <th>Create/Modefied Date</th>
        <th>Photo</th>
        <th>Company Id</th>
    </tr>
    </thead>
    <tbody>
    <%for (NewsEntity item : list) {%>
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
        <td><%=item.getTitle()%>
        </td>
        <td><%=item.getCreatedDate()%>/<%=item.getModifiedDate()%>
        </td>
        <td>
            <img src=" <%=item.getPhotoUrl()%>" width="40" height="30"/>
        </td>
        <td>
            <%=item.getCompanyId()%>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
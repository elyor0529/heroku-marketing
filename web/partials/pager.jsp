<%@ page import="models.PaginationResponseModel" %>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 9/1/2015
  Time: 1:58 PM
  To change this template use File | helpers.FactoryHelper | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final PaginationResponseModel<Object> model = (PaginationResponseModel<Object>) request.getAttribute("pager");
%>
<div class="row">

    <nav class="navbar navbar-left">
        <ul class="pagination pagination-lg">
            <%
                if (model.getCurrentPage() == 1 || model.getCurrentPage() == 0) {
            %>
            <li class="disabled">
                <a href="#"><i class="glyphicon glyphicon-fast-backward"></i></a>
            </li>
            <%
            } else {
            %>
            <li>
                <a href="?page=1&size=<%=model.getPageSize()%>">
                    <i class="glyphicon glyphicon-fast-backward"></i></a>
            </li>
            <%
                }
            %>
            <%
                if (model.getCurrentPage() == 1 || model.getCurrentPage() == 0) {
            %>
            <li class="disabled">
                <a href="#"><i class="glyphicon glyphicon-step-backward"></i></a>
            </li>
            <%
            } else {
            %>
            <li>
                <a href="?page=<%=model.getPrevPage()%>&size=<%=model.getPageSize()%>">
                    <i class="glyphicon glyphicon-step-backward"></i></a>
            </li>
            <%
                }
            %>
            <%
                if (model.getPageSize() == 0 || model.getCurrentPage() == model.getPageSize() - 1) {
            %>
            <li class="disabled">
                <a href="#"><i class="glyphicon glyphicon-step-forward"></i></a>
            </li>
            <%
            } else {
            %>
            <li>
                <a href="?page=<%=model.getNextPage()%>&size=<%=model.getPageSize()%>"><i
                        class="glyphicon glyphicon-step-forward"></i>
                </a>
            </li>
            <%
                }
            %>
            <%
                if (model.getPageSize() == 0 || model.getCurrentPage() == model.getPageSize() - 1) {
            %>
            <li class="disabled">
                <a href="#"><i class="glyphicon glyphicon-fast-forward"></i></a>
            </li>
            <%
            } else {
            %>
            <li>
                <a href="?page=<%=model.getPageSize()-1%>&size=<%=model.getPageSize()%>">
                    <i class="glyphicon glyphicon-fast-forward"></i></a>
            </li>
            <%
                }
            %>
        </ul>
    </nav>

    <nav class="navbar navbar-right">
        <ul class="pagination pagination-lg">
            <li class="<%=model.getPageSize()==25?"disabled":""%>"><a href="?page=1&size=25">25</a></li>
            <li class="<%=model.getPageSize()==50?"disabled":""%>"><a href="?page=1&size=50">50</a></li>
            <li class="<%=model.getPageSize()==100?"disabled":""%>"><a href="?page=1&size=100">100</a></li>
            <li class="<%=model.getPageSize()==0?"disabled":""%>"><a href="?page=0&size=0">All</a></li>
        </ul>
    </nav>
    <div class="clearfix"></div>

</div>
<%@ page import="db.CompaniesEntity" %>
<%@ page import="manager.CompanyManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="org.apache.commons.beanutils.converters.DoubleConverter" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>

<%
    int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<CompaniesEntity> manager = new CompanyManager();

    CompaniesEntity entity = null;

    if (id > 0) {

        //edit
        if (request.getMethod().equalsIgnoreCase("get")) {
            entity = manager.get(id);
        } else if (request.getMethod().equalsIgnoreCase("post")) {
            entity = manager.get(id);

            entity.setName(request.getParameter("name"));
            entity.setKey(request.getParameter("key"));
            entity.setCurrency((Double) new DoubleConverter(0).convert(String.class, request.getParameter("currency")));
            entity.setLogoUrl(request.getParameter("logo_url"));
            entity.setAbout(request.getParameter("about"));
            entity.setSiteUrl(request.getParameter("site_url"));
            entity.setPrivacyPolicy(request.getParameter("privacy_policy"));
            entity.setPhone(request.getParameter("phone"));

            if (manager.update(id, entity)) {
                pageContext.forward("view.jsp?id=" + id);
            }
        }
    } else {

        //create
        if (request.getMethod().equalsIgnoreCase("get")) {
            entity = new CompaniesEntity();
        } else if (request.getMethod().equalsIgnoreCase("post")) {
            entity = new CompaniesEntity();

            entity.setName(request.getParameter("name"));
            entity.setKey(request.getParameter("key"));
            entity.setCurrency((Double) new DoubleConverter(0).convert(String.class, request.getParameter("currency")));
            entity.setLogoUrl(request.getParameter("logo_url"));
            entity.setAbout(request.getParameter("about"));
            entity.setSiteUrl(request.getParameter("site_url"));
            entity.setPrivacyPolicy(request.getParameter("privacy_policy"));
            entity.setPhone(request.getParameter("phone"));

            id = manager.insert(entity);

            if (id > 0) {
                pageContext.forward("view.jsp?id=" + id);
            }
        }
    }

%>

<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 9/18/2015
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-horizontal" id="form1" method="post" accept-charset="utf-8" novalidate="novalidate">

    <div class="form-group ">
        <label for="c_name" class="control-label col-lg-2">Name <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_name" name="name" value="<%=entity.getName()%>"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_key" class="control-label col-lg-2">Key <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_key" name="key" value="<%=entity.getKey()%>"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_currency" class="control-label col-lg-2">Currency <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_currency" name="currency" value="<%=entity.getCurrency()%>"
                   type="number"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_logo_url" class="control-label col-lg-2">Logo URL <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_logo_url" name="logo_url" value="<%=entity.getLogoUrl()%>"
                   type="url"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_about" class="control-label col-lg-2">About <span class="required">*</span></label>

        <div class="col-lg-10">
                    <textarea class="form-control" id="c_about" name="about" value="<%=entity.getAbout()%>"

                              required="required"><%=entity.getAbout()%></textarea>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_site_url" class="control-label col-lg-2">Site URL <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_site_url" name="site_url" value="<%=entity.getSiteUrl()%>"
                   type="url"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_privacy_policy" class="control-label col-lg-2">Privacy policy</label>

        <div class="col-lg-10">
                    <textarea class="form-control" id="c_privacy_policy"
                              name="privacy_policy"><%=entity.getPrivacyPolicy()%></textarea>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_phone" class="control-label col-lg-2">Phone <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_phone" name="phone" value="<%=entity.getPhone()%>"
                   type="tel"
                   required="required"/>
        </div>
    </div>

</form>

<br/>
<br/>

<jsp:include page="/partials/form_bar.jsp">
    <jsp:param name="id" value="<%=id%>"/>
</jsp:include>

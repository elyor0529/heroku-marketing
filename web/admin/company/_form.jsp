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
        <label for="cname" class="control-label col-lg-2">Name <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="cname" name="name" value="<%=entity.getName()%>" minlength="5"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="ckey" class="control-label col-lg-2">Key <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="ckey" name="key" value="<%=entity.getKey()%>" minlength="5"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="ccurrency" class="control-label col-lg-2">Currency <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="ccurrency" name="currency" value="<%=entity.getCurrency()%>"
                   minlength="5" type="number"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="clogo_url" class="control-label col-lg-2">Logo URL <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="clogo_url" name="logo_url" value="<%=entity.getLogoUrl()%>"
                   minlength="5" type="url"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="cabout" class="control-label col-lg-2">About <span class="required">*</span></label>

        <div class="col-lg-10">
                    <textarea class="form-control" id="cabout" name="about" value="<%=entity.getAbout()%>" minlength="5"
                              required="required"><%=entity.getAbout()%></textarea>
        </div>
    </div>

    <div class="form-group ">
        <label for="csite_url" class="control-label col-lg-2">Site URL <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="csite_url" name="site_url" value="<%=entity.getSiteUrl()%>"
                   minlength="5" type="url"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="cprivacy_policy" class="control-label col-lg-2">Privacy policy</label>

        <div class="col-lg-10">
                    <textarea class="form-control" id="cprivacy_policy"
                              name="privacy_policy"><%=entity.getPrivacyPolicy()%></textarea>
        </div>
    </div>

    <div class="form-group ">
        <label for="cphone" class="control-label col-lg-2">Phone <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="cphone" name="phone" value="<%=entity.getPhone()%>" minlength="5"
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
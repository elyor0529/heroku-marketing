package servlets;

import helpers.FactoryHelper;
import utils.Settings;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by elyor on 8/19/2015.
 */
public abstract class BaseServlet extends HttpServlet {

    protected void printJson(HttpServletResponse response, Object obj) throws IOException {

        final String json = FactoryHelper.getGson().toJson(obj);

        response.setCharacterEncoding("utf-8");
        response.setContentType(Settings.REST_TYPE);
        response.getWriter().write(json);

    }

}

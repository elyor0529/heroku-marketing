package servlets;

import helpers.SettingsHelper;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by elyor on 8/19/2015.
 */
public abstract class BaseServlet extends HttpServlet {


    protected void printJson(HttpServletResponse response, String json) {

        response.setContentType(SettingsHelper.REST_TYPE);

        try {

            response.getWriter().write(json.toString());

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void printError(HttpServletResponse response, Exception exception) {

        String json = null;

        try {
            json = SettingsHelper.GSON.toJson(exception);
        } catch (Exception e) {
            e.printStackTrace();
        }

        printJson(response, json);
    }

}

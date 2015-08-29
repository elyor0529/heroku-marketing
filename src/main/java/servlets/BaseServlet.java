package servlets;

import helpers.SettingsHelper;
import manager.ManagerImpl;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by elyor on 8/19/2015.
 */
public abstract class BaseServlet extends HttpServlet {


    protected void printJson(HttpServletResponse response, JSONObject json) {

        response.setContentType(SettingsHelper.REST_TYPE);

        try {

            response.getWriter().write(json.toString());

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void printError(HttpServletResponse response, Exception exception) {

        final JSONObject json = new JSONObject();

        try {
            json.put("error", exception.getMessage());
        } catch (JSONException e) {
            e.printStackTrace();
        }

        printJson(response, json);
    }

}

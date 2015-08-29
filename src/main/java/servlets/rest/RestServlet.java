package servlets.rest;

import helpers.ConvertHelper;
import helpers.SettingsHelper;
import helpers.JsonHelper;
import manager.ManagerImpl;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import servlets.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * Created by elyor on 8/19/2015.
 */
public abstract class RestServlet<T> extends BaseServlet {

    private final ManagerImpl<T> manager;

    protected RestServlet(ManagerImpl<T> t) {
        manager = t;
    }

    protected final ManagerImpl<T> getManager() {
        return manager;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            JSONObject json;

            final int id = ConvertHelper.ToString(request.getParameter("id")).isEmpty()
                    ? 0
                    : ConvertHelper.ToInteger(request.getParameter("id"));

            if (id > 0) {

                final T t = manager.get(id);
                json = JsonHelper.toObject(t);

            } else {

                json = new JSONObject();

                final int size = manager.getSize();
                json.put("total", size);

                final int limit = ConvertHelper.ToString(request.getParameter("limit")).isEmpty()
                        ? SettingsHelper.PAGING.LIMIT
                        : ConvertHelper.ToInteger(request.getParameter("limit"));
                json.put("limit", limit);

                final int offset = ConvertHelper.ToString(request.getParameter("offset")).isEmpty()
                        ? SettingsHelper.PAGING.OFFSET
                        : ConvertHelper.ToInteger(request.getParameter("offset"));
                json.put("offset", offset);

                final List<T> list = manager.getAll(limit, offset);
                final JSONArray items = new JSONArray();

                for (T t : list) {

                    final JSONObject item = JsonHelper.toObject(t);

                    items.put(item);
                }

                json.put("items", items);
            }

            printJson(response, json);

        } catch (JSONException e) {
            printError(response, e);
        } catch (IllegalAccessException e) {
            printError(response, e);
        } catch (InstantiationException e) {
            printError(response, e);
        } catch (NoSuchMethodException e) {
            printError(response, e);
        } catch (InvocationTargetException e) {
            printError(response, e);
        }

    }

}

package servlets.rest;

import helpers.ConvertHelper;
import helpers.SettingsHelper;
import manager.ManagerImpl;
import models.RestResponseModel;
import servlets.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
            String json = null;

            final int id = ConvertHelper.ToString(request.getParameter("id")).isEmpty()
                    ? 0
                    : ConvertHelper.ToInteger(request.getParameter("id"));

            if (id > 0) {

                final T t = manager.get(id);

                json = SettingsHelper.GSON.toJson(t);
            } else {
                final RestResponseModel<T> t = new RestResponseModel<T>();

                final int size = manager.getSize();
                t.setTotal(size);

                final int limit = ConvertHelper.ToString(request.getParameter("limit")).isEmpty()
                        ? SettingsHelper.PAGING.LIMIT
                        : ConvertHelper.ToInteger(request.getParameter("limit"));
                t.setLimit(limit);

                final int offset = ConvertHelper.ToString(request.getParameter("offset")).isEmpty()
                        ? SettingsHelper.PAGING.OFFSET
                        : ConvertHelper.ToInteger(request.getParameter("offset"));
                t.setOffset(offset);

                final List<T> list = manager.getAll(limit, offset);

                t.setItems(list);

                json = SettingsHelper.GSON.toJson(t);
            }

            printJson(response, json);

        } catch (Exception e) {
            printError(response, e);
        }

    }

}

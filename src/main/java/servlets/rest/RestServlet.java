package servlets.rest;

import helpers.FactoryHelper;
import manager.ManagerImpl;
import models.RestResponseModel;
import org.apache.commons.beanutils.converters.IntegerConverter;
import servlets.BaseServlet;
import utils.Settings;

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

            final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));

            if (id > 0) {

                final T t = manager.get(id);

                json = FactoryHelper.getGson().toJson(t);
            } else {
                final RestResponseModel<T> t = new RestResponseModel<T>();

                final int size = manager.getSize();
                t.setTotal(size);

                final int limit = (Integer) new IntegerConverter(Settings.PAGING.LIMIT).convert(String.class, request.getParameter("limit"));
                t.setLimit(limit);

                final int offset = (Integer) new IntegerConverter(Settings.PAGING.OFFSET).convert(String.class, request.getParameter("offset"));
                t.setOffset(offset);

                final List<T> list = manager.getAll(limit, offset);

                t.setItems(list);

                json = FactoryHelper.getGson().toJson(t);
            }

            printJson(response, json);

        } catch (Exception e) {
            printError(response, e);
        }

    }

}

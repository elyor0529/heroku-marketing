package servlets.rest;

import helpers.FactoryHelper;
import manager.ManagerImpl;
import models.LimitationResponseModel;
import models.RestResponseModel;
import org.apache.commons.beanutils.converters.IntegerConverter;
import servlets.BaseServlet;
import utils.Settings;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

/**
 * Created by elyor on 8/19/2015.
 */
public abstract class RestServlet<T> extends BaseServlet {

    private final ManagerImpl<T> manager;
    private final T t;

    protected RestServlet(T t, ManagerImpl<T> manager) {
        this.t = t;
        this.manager = manager;
    }

    private T getEntity(HttpServletRequest request) throws IOException {
        final BufferedReader reader = request.getReader();
        final StringBuffer jb = new StringBuffer();

        String line;
        while ((line = reader.readLine()) != null) {
            jb.append(line);
        }

        final T entity = (T) FactoryHelper.getGson().fromJson(jb.toString(), t.getClass());

        return entity;
    }

    protected final ManagerImpl<T> getManager() {
        return manager;
    }

    protected final T getEntity() {
        return t;
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
                final LimitationResponseModel<T> t = new LimitationResponseModel<T>();

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

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            RestResponseModel model;
            final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));

            if (manager.delete(id)) {
                model = new RestResponseModel("OK", 200);
            } else {
                model = new RestResponseModel("Error", 503);
            }

            final String json = FactoryHelper.getGson().toJson(model);

            printJson(response, json);

        } catch (Exception e) {
            printError(response, e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            RestResponseModel model;
            final T entity = getEntity(request);

            if (manager.insert(entity)) {
                model = new RestResponseModel("OK", 200);
            } else {
                model = new RestResponseModel("Error", 503);
            }

            final String json = FactoryHelper.getGson().toJson(model);

            printJson(response, json);
        } catch (Exception e) {
            printError(response, e);
        }

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            RestResponseModel model;
            final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
            final T entity = getEntity(request);

            if (manager.update(id, entity)) {
                model = new RestResponseModel("OK", 200);
            } else {
                model = new RestResponseModel("Error", 503);
            }

            final String json = FactoryHelper.getGson().toJson(model);

            printJson(response, json);

        } catch (Exception e) {

            printError(response, e);
        }
    }
}

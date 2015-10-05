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
        RestResponseModel model;

        try {

            model = new RestResponseModel("OK", 200, "GET");
            final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));

            if (id > 0) {

                final T t = manager.get(id);

                model.setData(t);

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

                model.setData(t);
            }

        } catch (Exception e) {

            model = new RestResponseModel("ERROR", 404, "GET");
            model.setData(e);

        }

        final String json = FactoryHelper.getGson().toJson(model);

        printJson(response, json);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RestResponseModel model;

        try {
            T entity = getEntity(request);
            final int id = manager.insert(entity);

            if (id > 0) {
                entity = manager.get(id);
                model = new RestResponseModel("OK", 200, "POST");
                model.setData(entity);
            } else {
                model = new RestResponseModel("FAILURE", 503, "POST");
            }

        } catch (Exception e) {

            model = new RestResponseModel("ERROR", 404, "POST");
            model.setData(e);

        }

        final String json = FactoryHelper.getGson().toJson(model);

        printJson(response, json);

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RestResponseModel model;

        try {
            T entity = getEntity(request);
            final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));

            if (manager.update(id, entity)) {
                entity = manager.get(id);
                model = new RestResponseModel("OK", 200, "PUT");
                model.setData(entity);
            } else {
                model = new RestResponseModel("FAILURE", 503, "PUT");
            }

        } catch (Exception e) {

            model = new RestResponseModel("ERROR", 404, "PUT");
            model.setData(e);

        }

        final String json = FactoryHelper.getGson().toJson(model);

        printJson(response, json);

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RestResponseModel model;

        try {
            final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));

            if (manager.delete(id)) {
                model = new RestResponseModel("OK", 200, "DELETE");
            } else {
                model = new RestResponseModel("FAILURE", 503, "DELETE");
            }

        } catch (Exception e) {

            model = new RestResponseModel("ERROR", 404, "DELETE");
            model.setData(e);

        }

        final String json = FactoryHelper.getGson().toJson(model);

        printJson(response, json);
    }

}

package servlets.rest.db;

import db.NewsEntity;
import manager.NewsManager;
import servlets.rest.RestServlet;

/**
 * Created by elyor on 8/9/2015.
 */
public class NewsServlet extends RestServlet<NewsEntity> {

    public NewsServlet() {
        super(new NewsEntity(), new NewsManager());
    }

}

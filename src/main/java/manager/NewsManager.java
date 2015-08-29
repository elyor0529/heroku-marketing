package manager;

import db.DevicesEntity;
import db.NewsEntity;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import utils.HibernateFactory;

import java.util.List;

/**
 * Created by elyor on 8/9/2015.
 */
public class NewsManager extends BaseManager<NewsEntity> {

    public NewsManager() {
        super(new NewsEntity());
    }

    @Override
    public int insert(NewsEntity newsEntity) {
        return 0;
    }

    @Override
    public boolean update(NewsEntity newsEntity) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}

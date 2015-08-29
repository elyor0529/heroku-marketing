package manager;

import db.CompaniesEntity;
import javafx.scene.effect.Reflection;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import sun.misc.ClassLoaderUtil;
import sun.security.jca.GetInstance;
import utils.HibernateFactory;

import java.util.List;

/**
 * Created by elyor on 8/20/2015.
 */
public abstract class BaseManager<T> implements ManagerImpl<T> {

    private final Session session;
    private final String entityName;
    private final T t;

    public BaseManager(T t) {
        this.t = t;
        entityName = t.getClass().getName();
        session = HibernateFactory.getSession();
    }

    protected final Session getSession() {
        return session;
    }

    @Override
    public List<T> getAll(int limit, int offset) {
        final String sql = "from " + entityName;
        final Query query = session.createQuery(sql);

        if (limit > 0) {
            query.setMaxResults(limit);
        }

        if (offset >= 0) {
            query.setFirstResult(offset);
        }

        final List<T> result = query.list();

        return result;
    }

    @Override
    public int getSize() {
        final String sql = "from " + entityName;
        final Query query = session.createQuery(sql);
        final List<T> result = query.list();

        return result == null ? 0 : result.size();
    }

    @Override
    public T get(int id) {
        final String sql = "from " + entityName + " where id=:id";
        final Query query = session.createQuery(sql);

        query.setParameter("id", id);

        final List<T> result = query.list();

        return result.size() > 0 ? result.get(0) : null;
    }

}

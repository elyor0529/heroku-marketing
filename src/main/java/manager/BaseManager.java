package manager;

import helpers.FactoryHelper;
import org.hibernate.Query;
import org.hibernate.Session;

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
        session = FactoryHelper.getSession();
    }

    protected final Session getSession() {
        return session;
    }

    @Override
    public List<T> getAll(int limit, int offset) throws Exception {

        try {
            final String sql = "from " + entityName;
            final Query query = session.createQuery(sql);

            if (limit >= 0) {
                query.setMaxResults(limit);
            }

            if (offset >= 0) {
                query.setFirstResult(offset);
            }

            final List<T> result = query.list();

            return result;

        } catch (Exception e) {
            e.printStackTrace();

            throw e;
        }
    }

    @Override
    public int getSize() throws Exception {
        try {
            final String sql = "from " + entityName;
            final Query query = session.createQuery(sql);
            final List<T> result = query.list();

            return result == null ? 0 : result.size();
        } catch (Exception e) {
            e.printStackTrace();

            throw e;
        }
    }

    @Override
    public T get(int id) throws Exception {

        try {
            final String sql = "from " + entityName + " where id=:id";
            final Query query = session.createQuery(sql);

            query.setParameter("id", id);

            final List<T> result = query.list();

            return result.size() > 0 ? result.get(0) : null;

        } catch (Exception e) {
            e.printStackTrace();

            throw e;
        }

    }

}

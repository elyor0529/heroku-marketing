package manager;

import db.NewsEntity;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 * Created by elyor on 8/9/2015.
 */
public class NewsManager extends BaseManager<NewsEntity> {

    public NewsManager() {
        super(new NewsEntity());
    }

    @Override
    public boolean insert(NewsEntity t) {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "INSERT INTO news(photo_url,modified_date,created_date,content,title,company_id) " +
                    "VALUES(:photo_url,:modified_date,:created_date,:content,:title,:company_id);";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            result = query.executeUpdate() > 0;

            transaction.commit();

        } catch (Exception ext) {

            transaction.rollback();

            ext.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean update(NewsEntity t) {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "UPDATE news SET photo_url=:photo_url," +
                    "modified_date=:modified_date," +
                    "created_date=:created_date," +
                    "content=:content," +
                    "title=:title, " +
                    "company_id=:company_id " +
                    "WHERE id=:id;";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            result = query.executeUpdate() > 0;

            transaction.commit();

        } catch (Exception ext) {

            transaction.rollback();

            ext.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean delete(int id) {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "DELETE FROM news WHERE id=:id;";
            final Query query = getSession().createSQLQuery(sql);

            query.setParameter("id", id);

            result = query.executeUpdate() > 0;

            transaction.commit();

        } catch (Exception ext) {
            transaction.rollback();

            ext.printStackTrace();
        }

        return result;
    }

}

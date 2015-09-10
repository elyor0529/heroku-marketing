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
    public int insert(NewsEntity t) throws Exception {
        int result = 0;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "INSERT INTO news(photo_url,modified_date,created_date,content,title,company_id) " +
                    "VALUES(:photoUrl,:modifiedDate,:createdDate,:content,:title,:companyId);";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            if (query.executeUpdate() > 0) {
                result = (Integer) getSession().createSQLQuery("SELECT max(id) FROM news;")
                        .uniqueResult();
            }

            transaction.commit();

        } catch (Exception e) {

            transaction.rollback();

            e.printStackTrace();

            throw e;
        }

        return result;
    }

    @Override
    public boolean update(int id, NewsEntity t) throws Exception {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "UPDATE news SET photo_url=:photoUrl," +
                    "modified_date=:modifiedDate," +
                    "created_date=:createdDate," +
                    "content=:content," +
                    "title=:title, " +
                    "company_id=:companyId " +
                    "WHERE id=" + id + ";";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            result = query.executeUpdate() > 0;

            transaction.commit();

        } catch (Exception e) {

            transaction.rollback();

            e.printStackTrace();

            throw e;
        }

        return result;
    }

    @Override
    public boolean delete(int id) throws Exception {

        boolean result;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "DELETE from news where id=" + id + ";";
            final Query query = getSession().createSQLQuery(sql);

            result = query.executeUpdate() > 0;

            transaction.commit();

        } catch (Exception e) {
            transaction.rollback();

            e.printStackTrace();

            throw e;
        }

        return result;
    }

}

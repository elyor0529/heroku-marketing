package manager;

import db.CompaniesEntity;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 * Created by elyor on 8/9/2015.
 */
public class CompanyManager extends BaseManager<CompaniesEntity> {

    public CompanyManager() {
        super(new CompaniesEntity());
    }

    @Override
    public int insert(CompaniesEntity t) {
        int result = 0;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "INSERT INTO companies(name,key,currency,logo_url,about,site_url,privacy_policy,phone) " +
                    "VALUES(:name,:key,:currency,:logo_url,:about,:site_url,:privacy_policy,:phone);";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            if (query.executeUpdate() > 0) {
                final Object lastObj = getSession().createSQLQuery("SELECT LAST_INSERT_ID();")
                        .uniqueResult();

                result = (Integer) lastObj;
            }

            transaction.commit();

        } catch (Exception ext) {

            transaction.rollback();

            ext.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean update(CompaniesEntity t) {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "UPDATE companies SET name=:name," +
                    "key=:key," +
                    "currency=:currency," +
                    "logo_url=:logo_url," +
                    "about=:about," +
                    "site_url=:site_url," +
                    "privacy_policy=:privacy_policy ," +
                    "phone=:phone " +
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

            final String sql = "DELETE FROM companies WHERE id=:id;";
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

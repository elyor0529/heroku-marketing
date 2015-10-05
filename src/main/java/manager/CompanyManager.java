package manager;

import db.CompaniesEntity;
import org.hibernate.Query;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by elyor on 8/9/2015.
 */
public class CompanyManager extends BaseManager<CompaniesEntity> {

    public CompanyManager() {
        super(new CompaniesEntity());
    }

    @Override
    public int insert(CompaniesEntity t) throws Exception {
        int result = 0;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "INSERT INTO companies(name,key,currency,logo_url,about,site_url,privacy_policy,phone) " +
                    "VALUES(:name,:key,:currency,:logoUrl,:about,:siteUrl,:privacyPolicy,:phone);";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            query.executeUpdate();

            transaction.commit();

            result = (Integer) getSession().createSQLQuery("SELECT max(id) FROM companies;")
                    .uniqueResult();

        } catch (Exception ext) {

            transaction.rollback();

            ext.printStackTrace();

            throw ext;
        }

        return result;
    }

    @Override
    public boolean update(int id, CompaniesEntity t) throws Exception {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "UPDATE companies SET name=:name," +
                    "key=:key," +
                    "currency=:currency," +
                    "logo_url=:logoUrl," +
                    "about=:about," +
                    "site_url=:siteUrl," +
                    "privacy_policy=:privacyPolicy ," +
                    "phone=:phone " +
                    "WHERE id=" + id + ";";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            query.executeUpdate();

            transaction.commit();

            result = true;

        } catch (Exception ext) {

            transaction.rollback();

            ext.printStackTrace();

            throw ext;
        }

        return result;
    }

    @Override
    public boolean delete(int id) throws Exception {

        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "DELETE from companies where id=" + id + ";";
            final Query query = getSession().createSQLQuery(sql);

            query.executeUpdate();

            transaction.commit();

            result = true;

        } catch (Exception e) {
            transaction.rollback();

            e.printStackTrace();

            throw e;
        }

        return result;
    }

    public CompaniesEntity get(String key) throws Exception {

        try {
            final String sql = "from CompaniesEntity where key=:key";
            final Query query = getSession().createQuery(sql);

            query.setParameter("key", key);

            final List<CompaniesEntity> result = query.list();

            return result.size() > 0 ? result.get(0) : null;

        } catch (Exception e) {
            e.printStackTrace();

            throw e;
        }

    }

}

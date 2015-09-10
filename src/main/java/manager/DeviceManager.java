package manager;

import db.DevicesEntity;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 * Created by elyor on 8/9/2015.
 */
public class DeviceManager extends BaseManager<DevicesEntity> {

    public DeviceManager() {
        super(new DevicesEntity());
    }

    @Override
    public int insert(DevicesEntity t) throws Exception {
        int result = 0;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "INSERT INTO devices(brand,model,token,company_key,unique_id) " +
                    "VALUES(:brand,:model,:token,:companyKey,:uniqueId);";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            if (query.executeUpdate() > 0) {
                result = (Integer) getSession().createSQLQuery("SELECT max(id) FROM devices;")
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
    public boolean update(int id, DevicesEntity t) throws Exception {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "UPDATE devices SET brand=:brand," +
                    "model=:model," +
                    "token=:token," +
                    "company_key=:companyKey," +
                    "unique_id=:uniqueId " +
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

            final String sql = "DELETE from devices where id=" + id + ";";
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

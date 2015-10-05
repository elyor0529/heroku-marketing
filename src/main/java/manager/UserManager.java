package manager;

import db.UsersEntity;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 * Created by elyor on 8/9/2015.
 */
public class UserManager extends BaseManager<UsersEntity> {

    public UserManager() {
        super(new UsersEntity());
    }

    @Override
    public int insert(UsersEntity t) throws Exception {
        int result = 0;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "INSERT INTO users(full_name,email,gender,birthday,promotional_code,device_id) " +
                    "VALUES(:fullName,:email,:gender,:birthday,:promotionalCode,:deviceId);";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            query.executeUpdate();

            transaction.commit();

            result = (Integer) getSession().createSQLQuery("SELECT max(id) FROM users;")
                    .uniqueResult();

        } catch (Exception e) {

            transaction.rollback();

            e.printStackTrace();

            throw e;
        }

        return result;
    }

    @Override
    public boolean update(int id, UsersEntity t) throws Exception {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "UPDATE users SET device_id=:deviceId," +
                    "full_name=:fullName," +
                    "email=:email," +
                    "gender=:gender," +
                    "birthday=:birthday," +
                    "promotional_code=:promotionalCode " +
                    "WHERE id=" + id + ";";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

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

    @Override
    public boolean delete(int id) throws Exception {

        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "DELETE from users where id=" + id + ";";
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

}

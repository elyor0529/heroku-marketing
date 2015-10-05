package manager;

import db.ProductsEntity;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 * Created by elyor on 8/9/2015.
 */
public class ProductManager extends BaseManager<ProductsEntity> {

    public ProductManager() {
        super(new ProductsEntity());
    }

    @Override
    public int insert(ProductsEntity t) throws Exception {
        int result = 0;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "INSERT INTO products(photo_url,description,name,mark,company_id) " +
                    "VALUES(:photoUrl,:description,:name,:mark,:companyId);";
            final Query query = getSession().createSQLQuery(sql);

            query.setProperties(t);

            query.executeUpdate();

            transaction.commit();

            result = (Integer) getSession().createSQLQuery("SELECT max(id) FROM products;")
                    .uniqueResult();

        } catch (Exception e) {

            transaction.rollback();

            e.printStackTrace();

            throw e;
        }

        return result;
    }

    @Override
    public boolean update(int id, ProductsEntity t) throws Exception {
        boolean result = false;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "UPDATE products SET photo_url=:photoUrl," +
                    "description=:description," +
                    "name=:name," +
                    "mark=:mark," +
                    "company_id=:companyId " +
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

        boolean result = true;
        final Transaction transaction = getSession().getTransaction();

        try {

            transaction.begin();

            final String sql = "DELETE from products where id=" + id + ";";
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

package manager;

import db.NewsEntity;
import db.ProductsEntity;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import utils.HibernateFactory;

import java.util.List;

/**
 * Created by elyor on 8/9/2015.
 */
public class ProductManager extends BaseManager<ProductsEntity> {

    public ProductManager() {
        super(new ProductsEntity());
    }

    @Override
    public int insert(ProductsEntity productsEntity) {
        return 0;
    }

    @Override
    public boolean update(ProductsEntity productsEntity) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}

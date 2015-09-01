package manager;

import db.ProductsEntity;

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

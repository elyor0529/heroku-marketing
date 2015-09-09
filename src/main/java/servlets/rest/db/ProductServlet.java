package servlets.rest.db;

import db.ProductsEntity;
import manager.ProductManager;
import servlets.rest.RestServlet;

/**
 * Created by elyor on 8/9/2015.
 */
public class ProductServlet extends RestServlet<ProductsEntity> {

    public ProductServlet() {
        super(new ProductsEntity(), new ProductManager());
    }

}

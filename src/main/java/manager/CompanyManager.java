package manager;

import db.CompaniesEntity;
import db.ProductsEntity;
import db.UsersEntity;
import helpers.ConvertHelper;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateFactory;

import java.util.List;

/**
 * Created by elyor on 8/9/2015.
 */
public class CompanyManager extends BaseManager<CompaniesEntity> {

    public CompanyManager() {
        super(new CompaniesEntity());
    }

    @Override
    public int insert(CompaniesEntity companiesEntity) {
        return 0;
    }

    @Override
    public boolean update(CompaniesEntity companiesEntity) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}

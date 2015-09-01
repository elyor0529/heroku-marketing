package manager;

import db.CompaniesEntity;

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

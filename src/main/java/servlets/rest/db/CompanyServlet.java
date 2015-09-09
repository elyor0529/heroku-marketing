package servlets.rest.db;

import db.CompaniesEntity;
import manager.CompanyManager;
import servlets.rest.RestServlet;

/**
 * Created by elyor on 8/9/2015.
 */
public class CompanyServlet extends RestServlet<CompaniesEntity> {

    public CompanyServlet() {
        super(new CompaniesEntity(), new CompanyManager());
    }

}

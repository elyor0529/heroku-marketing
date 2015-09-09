package servlets.rest.db;

import db.UsersEntity;
import manager.UserManager;
import servlets.rest.RestServlet;

/**
 * Created by elyor on 8/9/2015.
 */
public class UserServlet extends RestServlet<UsersEntity> {

    public UserServlet() {
        super(new UsersEntity(), new UserManager());
    }

}

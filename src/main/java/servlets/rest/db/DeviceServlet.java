package servlets.rest.db;

import db.DevicesEntity;
import manager.DeviceManager;
import servlets.rest.RestServlet;

/**
 * Created by elyor on 8/9/2015.
 */
public class DeviceServlet extends RestServlet<DevicesEntity> {

    public DeviceServlet() {
        super(new DevicesEntity(), new DeviceManager());
    }

}

package manager;

import db.CompaniesEntity;
import db.DevicesEntity;
import db.UsersEntity;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import utils.HibernateFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by elyor on 8/9/2015.
 */
public class DeviceManager extends BaseManager<DevicesEntity> {


    public DeviceManager() {
        super(new DevicesEntity());
    }

    @Override
    public int insert(DevicesEntity devicesEntity) {
        return 0;
    }

    @Override
    public boolean update(DevicesEntity devicesEntity) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}

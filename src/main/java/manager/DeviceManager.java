package manager;

import db.DevicesEntity;

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

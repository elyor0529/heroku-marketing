package manager;

import db.NewsEntity;

/**
 * Created by elyor on 8/9/2015.
 */
public class NewsManager extends BaseManager<NewsEntity> {

    public NewsManager() {
        super(new NewsEntity());
    }

    @Override
    public int insert(NewsEntity newsEntity) {
        return 0;
    }

    @Override
    public boolean update(NewsEntity newsEntity) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}

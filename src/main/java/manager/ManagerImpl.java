package manager;

import java.util.List;

/**
 * Created by elyor on 8/9/2015.
 */
public interface ManagerImpl<T> {

    List<T> getAll(int limit, int offset);

    int getSize();

    T get(int id);

    boolean insert(T t);

    boolean update(T t);

    boolean delete(int id);

}
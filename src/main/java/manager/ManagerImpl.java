package manager;

import java.util.List;

/**
 * Created by elyor on 8/9/2015.
 */
public interface ManagerImpl<T> {

    List<T> getAll(int limit, int offset) throws Exception;

    int getSize() throws Exception;

    T get(int id) throws Exception;

    int insert(T t) throws Exception;

    boolean update(int id, T t) throws Exception;

    boolean delete(int id) throws Exception;

}
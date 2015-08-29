package helpers;

import db.UsersEntity;
import org.apache.commons.lang3.text.WordUtils;
import org.hibernate.metadata.ClassMetadata;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;
import sun.reflect.Reflection;
import utils.StringGenerator;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by elyor on 8/19/2015.
 */
public final class JsonHelper {

    public final static JSONObject toObject(Object o) throws JSONException, IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {
        final JSONObject item = new JSONObject();
        final Class cls = o.getClass();
        final Field[] fields = cls.getDeclaredFields();

        for (Field field : fields) {
            final String fieldName = field.getName();
            final String methodName = "get" + WordUtils.capitalize(fieldName);
            final Method method = cls.getMethod(methodName, null);
            final Object result = method.invoke(o, null);

            item.put(fieldName, result);
        }

        return item;
    }

}

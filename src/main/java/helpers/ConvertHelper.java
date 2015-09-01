package helpers;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by elyor on 8/9/2015.
 */
public class ConvertHelper {

    public static String ToString(Object o) {
        return o != null ? o.toString() : "";
    }

    public static String ToString(String s) {
        return s != null ? s : "";
    }

    public static Date ToDate(Object o) {
        return ToDate(ToString(o));
    }

    public static Date ToDate(String s) {

        if (s.isEmpty())
            return null;

        Date dt;
        try {
            final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            dt = dateFormat.parse(s);
        } catch (Exception e) {
            dt = null;
        }

        return dt;
    }

    public static Integer ToInteger(String s) {

        if (ToString(s).isEmpty()) {
            return null;
        }

        return Integer.parseInt(ToString(s));
    }

    public static Integer ToInteger(Object o) {
        return ToInteger(ToString(o));
    }

}
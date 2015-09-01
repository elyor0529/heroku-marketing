package utils;

import java.util.Locale;

/**
 * Created by elyor on 9/1/2015.
 */
public class Settings {

    //locale
    public static final Locale LOCALE = Locale.US;
    //host
    public static final boolean SERVER_IS_LOCALE = true;
    //mime types
    public static final String REST_TYPE = "application/json";

    //rest
    public static class PAGING {
        public static final int PAGE = 1;
        public static final int COUNT = 10;
        public static final int LIMIT = 25;
        public static final int OFFSET = 0;

    }
}

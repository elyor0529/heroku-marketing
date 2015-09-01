package utils;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 * Created by Elyor on 8/10/2014.
 */

public class Settings {

    //locale
    public static final Locale LOCALE = Locale.US;
    //host
    public static final boolean SERVER_IS_LOCALE = true;
    //mime types
    public static final String REST_TYPE = "application/json";

    //resource
    public static ResourceBundle getResourceBundle() {
        return ResourceBundle.getBundle("Main.properties", LOCALE);
    }

    //json
    public static final Gson getGson() {
        return new GsonBuilder()
                .disableHtmlEscaping()
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                .setPrettyPrinting()
                .serializeNulls()
                .create();
    }

    //rest
    public static final class PAGING {
        public static final int PAGE = 1;
        public static final int COUNT = 10;
        public static final int LIMIT = 25;
        public static final int OFFSET = 0;

    }

}

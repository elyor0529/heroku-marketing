package helpers;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 * Created by Elyor on 8/10/2014.
 */

public class SettingsHelper {

    //locale
    public static final Locale LOCALE = new Locale("en", "US");

    //json
    public static final Gson GSON = new GsonBuilder()
            .disableHtmlEscaping()
            .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
            .setPrettyPrinting()
            .serializeNulls()
            .create();

    //resource
    public final static ResourceBundle RESOURCE_BUNDLE = ResourceBundle.getBundle("i18n/Resource.properties", LOCALE);

    //mime types
    public static final String REST_TYPE = "application/json";
    //net
    public static final String REMOTE_HOST = "http://localhost:6070";

    //rest
    public static final class PAGING {
        public static final int PAGE = 1;
        public static final int COUNT = 10;
        public static final int LIMIT = 25;
        public static final int OFFSET = 0;
    }

}

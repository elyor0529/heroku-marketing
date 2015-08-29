package helpers;

import java.util.ResourceBundle;

/**
 * Created by Elyor on 8/10/2014.
 */

public final class SettingsHelper {

    //resource
    public final static ResourceBundle MAIN_RESOURCE_BUNDLE = ResourceBundle.getBundle("Resource.properties");

    //rest
    public static final String REST_TYPE = "application/json";

    public static final class PAGING {
        public static final int PAGE = 1;
        public static final int COUNT = 10;
        public static final int LIMIT = 25;
        public static final int OFFSET = 0;
    }

}

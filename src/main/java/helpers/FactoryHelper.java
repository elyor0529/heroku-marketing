package helpers;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import utils.Settings;

import java.util.ResourceBundle;

/**
 * Created by Elyor on 8/10/2014.
 */

public class FactoryHelper {

    //hibernate
    private static SessionFactory sessionFactory;
    //resource
    private static ResourceBundle resourceBundle;
    //json
    private static Gson gson;

    public static SessionFactory getSessionFactory() throws HibernateException {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration();

                if (Settings.SERVER_IS_LOCALE) {
                    configuration.configure("hibernate_locale.cfg.xml");
                } else {
                    configuration.configure("hibernate_remote.cfg.xml");
                }

                ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
                sessionFactory = configuration.buildSessionFactory(serviceRegistry);

            } catch (Throwable e) {
                e.printStackTrace();
                throw new ExceptionInInitializerError(e);
            }
        }
        return sessionFactory;
    }

    public static Session getSession() throws HibernateException {
        return getSessionFactory().openSession();
    }

    public static ResourceBundle getResourceBundle() {
        if (resourceBundle == null) {
            resourceBundle = ResourceBundle.getBundle("Main.properties", Settings.LOCALE);
        }

        return resourceBundle;
    }

    public static Gson getGson() {
        if (gson == null) {
            gson = new GsonBuilder()
                    .disableHtmlEscaping()
                    .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                    .setPrettyPrinting()
                    .serializeNulls()
                    .create();
        }

        return gson;
    }

}

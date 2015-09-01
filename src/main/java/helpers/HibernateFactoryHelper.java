package helpers;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import utils.Settings;

/**
 * Created by Elyor on 8/10/2014.
 */
public final class HibernateFactoryHelper {
    private static final SessionFactory sessionFactory;
    private static final ServiceRegistry serviceRegistry;

    static {
        try {
            Configuration configuration = new Configuration();

            if (Settings.SERVER_IS_LOCALE) {
                configuration.configure("hibernate_locale.cfg.xml");
            } else {
                configuration.configure("hibernate_remote.cfg.xml");
            }

            serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);

        } catch (Throwable e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    public final static SessionFactory getSessionFactory() throws HibernateException {
        return sessionFactory;
    }

    public final static Session getSession() throws HibernateException {
        return getSessionFactory().openSession();
    }
}

import helpers.FactoryHelper;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.type.Type;

import java.util.Map;

/**
 * Created by elyor on 8/9/2015.
 */
public class Main {

    public static void main(final String[] args) throws Exception {


        System.out.println("------------------------------------");

        RunHibernate();

        System.out.println("------------------------------------");

    }

    private static void RunHibernate() {
        final Session session = FactoryHelper.getSession();
        final Map metadataMap = session.getSessionFactory().getAllClassMetadata();
        for (Object key : metadataMap.keySet()) {

            final ClassMetadata classMetadata = (ClassMetadata) metadataMap.get(key);
            final String entityName = classMetadata.getEntityName();
            final Query query = session.createQuery("from " + entityName);

            System.out.println();
            System.out.println("executing: " + query.getQueryString());

            final String[] names = classMetadata.getPropertyNames();

            for (int propertyIndex = 0; propertyIndex < names.length; propertyIndex++) {
                Type type = classMetadata.getPropertyType(names[propertyIndex]);

                System.out.println("\t" + names[propertyIndex] + "(" + type.getName() + ")");
            }

        }
    }
}

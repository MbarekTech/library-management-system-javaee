package metier;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import java.sql.Connection;
import java.sql.DriverManager;

public class HibernateUtil {
    private static SessionFactory sessionFactory;
    
    static {
        try {
            // Load MySQL driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Test connection first
            String url = "jdbc:mysql://localhost:3306/gestionnaire_bibliotheque?useSSL=false&allowPublicKeyRetrieval=true";
            String username = "root";
            String password = "";
            
            // Try to establish a test connection
            try (Connection testConn = DriverManager.getConnection(url, username, password)) {
                System.out.println("Test connection successful");
            } catch (Exception e) {
                System.out.println("Test connection failed: " + e.getMessage());
                // Try alternative connection method
                try (Connection testConn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/gestionnaire_bibliotheque?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8",
                    username, password)) {
                    System.out.println("Alternative connection successful");
                }
            }
            
            // Create Hibernate configuration
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            
            // Build session factory
            sessionFactory = configuration.buildSessionFactory();
            
        } catch (Exception e) {
            System.err.println("Error initializing Hibernate: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
} 
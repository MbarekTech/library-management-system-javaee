package metier;
import entity.*;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import java.util.*;

public class GererBibliotheque {
    
    private static SessionFactory sessionFactory;
    
    static {
        try {
            sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("Error initializing Hibernate: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    // Méthodes pour les Livres
    public static void ajouterLivre(String isbn, String titre, int auteurId, int categorieId, 
                                   int anneePublication, int nombrePages, int nombreExemplaires, 
                                   double prix, String description) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Auteur auteur = (Auteur) session.get(Auteur.class, auteurId);
            Categorie categorie = (Categorie) session.get(Categorie.class, categorieId);
            
            Livre livre = new Livre(isbn, titre, auteur, categorie, anneePublication, 
                                   nombrePages, nombreExemplaires, new java.math.BigDecimal(prix), description);
            session.save(livre);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public static void supprimerLivre(int idLivre) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Livre livre = (Livre) session.get(Livre.class, idLivre);
            if (livre != null) {
                session.delete(livre);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public static void modifierLivre(int idLivre, String isbn, String titre, int auteurId, 
                                   int categorieId, int anneePublication, int nombrePages, 
                                   int nombreExemplaires, double prix, String description) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Livre livre = (Livre) session.get(Livre.class, idLivre);
            if (livre != null) {
                livre.setIsbn(isbn);
                livre.setTitre(titre);
                livre.setAuteur((Auteur) session.get(Auteur.class, auteurId));
                livre.setCategorie((Categorie) session.get(Categorie.class, categorieId));
                livre.setAnneePublication(anneePublication);
                livre.setNombrePages(nombrePages);
                livre.setNombreExemplaires(nombreExemplaires);
                livre.setPrix(new java.math.BigDecimal(prix));
                livre.setDescription(description);
                session.update(livre);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public static List<Livre> listerLivres() {
        Session session = sessionFactory.openSession();
        try {
            List<Livre> liste = (List<Livre>) session.createQuery("from Livre").list();
            return liste;
        } finally {
            session.close();
        }
    }
    
    public static Livre trouverLivre(int idLivre) {
        Session session = sessionFactory.openSession();
        try {
            Livre livre = (Livre) session.get(Livre.class, idLivre);
            return livre;
        } finally {
            session.close();
        }
    }
    
    // Méthodes pour les Membres
    public static void ajouterMembre(String nom, String prenom, 
                                   String email, String telephone, String adresse, String statut) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            // Générer automatiquement le numéro de membre
            String numeroMembre = genererNumeroMembre(session);
            
            Membre membre = new Membre(numeroMembre, nom, prenom, email, telephone, adresse, new Date());
            membre.setStatut(Membre.StatutMembre.valueOf(statut));
            session.save(membre);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    // Méthode pour générer automatiquement le numéro de membre
    private static String genererNumeroMembre(Session session) {
        // Récupérer le dernier numéro de membre
        String dernierNumero = (String) session.createQuery(
            "SELECT m.numeroMembre FROM Membre m ORDER BY m.numeroMembre DESC")
            .setMaxResults(1)
            .uniqueResult();
        
        if (dernierNumero == null) {
            // Si aucun membre n'existe, commencer par MEM001
            return "MEM001";
        }
        
        // Extraire le numéro et l'incrémenter
        String prefix = dernierNumero.substring(0, 3); // "MEM"
        int numero = Integer.parseInt(dernierNumero.substring(3)); // "001" -> 1
        numero++; // Incrémenter
        
        // Formater avec des zéros en tête (ex: 2 -> "002")
        return String.format("%s%03d", prefix, numero);
    }
    
    public static List<Membre> listerMembres() {
        Session session = sessionFactory.openSession();
        try {
            List<Membre> liste = (List<Membre>) session.createQuery("from Membre").list();
            return liste;
        } finally {
            session.close();
        }
    }
    
    public static Membre trouverMembre(int idMembre) {
        Session session = sessionFactory.openSession();
        try {
            Membre membre = (Membre) session.get(Membre.class, idMembre);
            return membre;
        } finally {
            session.close();
        }
    }
    
    public static void modifierMembre(int idMembre, String nom, String prenom, 
                                    String email, String telephone, String adresse, String statut) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Membre membre = (Membre) session.get(Membre.class, idMembre);
            if (membre != null) {
                // Ne pas modifier le numero_membre, il reste inchangé
                membre.setNom(nom);
                membre.setPrenom(prenom);
                membre.setEmail(email);
                membre.setTelephone(telephone);
                membre.setAdresse(adresse);
                membre.setStatut(Membre.StatutMembre.valueOf(statut));
                session.update(membre);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public static void supprimerMembre(int idMembre) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Membre membre = (Membre) session.get(Membre.class, idMembre);
            if (membre != null) {
                // Vérifier s'il y a des emprunts en cours pour ce membre
                List<Emprunt> empruntsEnCours = session.createQuery(
                    "from Emprunt e where e.membre.id = :membreId and e.statut = 'en_cours'")
                    .setParameter("membreId", idMembre)
                    .list();
                
                if (!empruntsEnCours.isEmpty()) {
                    throw new RuntimeException("Impossible de supprimer le membre car il a des emprunts en cours");
                }
                
                session.delete(membre);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    // Méthodes pour les Emprunts
    public static void emprunterLivre(int idLivre, int idMembre, Date dateRetourPrevue) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Livre livre = (Livre) session.get(Livre.class, idLivre);
            Membre membre = (Membre) session.get(Membre.class, idMembre);
            
            if (livre != null && membre != null && livre.isDisponible()) {
                Emprunt emprunt = new Emprunt(livre, membre, new Date(), dateRetourPrevue);
                session.save(emprunt);
                
                // Mettre à jour le nombre d'exemplaires disponibles
                livre.setNombreDisponibles(livre.getNombreDisponibles() - 1);
                session.update(livre);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public static void retournerLivre(int idEmprunt) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Emprunt emprunt = (Emprunt) session.get(Emprunt.class, idEmprunt);
            if (emprunt != null) {
                emprunt.setDateRetourEffective(new Date());
                emprunt.setStatut(Emprunt.StatutEmprunt.retourne);
                session.update(emprunt);
                
                // Mettre à jour le nombre d'exemplaires disponibles
                Livre livre = emprunt.getLivre();
                livre.setNombreDisponibles(livre.getNombreDisponibles() + 1);
                session.update(livre);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public static void modifierEmprunt(int idEmprunt, int livreId, int membreId, Date dateRetourPrevue, String statut) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Emprunt emprunt = (Emprunt) session.get(Emprunt.class, idEmprunt);
            if (emprunt != null) {
                Livre nouveauLivre = (Livre) session.get(Livre.class, livreId);
                Membre nouveauMembre = (Membre) session.get(Membre.class, membreId);
                
                if (nouveauLivre != null && nouveauMembre != null) {
                    emprunt.setLivre(nouveauLivre);
                    emprunt.setMembre(nouveauMembre);
                    emprunt.setDateRetourPrevue(dateRetourPrevue);
                    emprunt.setStatut(Emprunt.StatutEmprunt.valueOf(statut));
                    session.update(emprunt);
                }
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public static List<Emprunt> listerEmprunts() {
        Session session = sessionFactory.openSession();
        try {
            List<Emprunt> liste = (List<Emprunt>) session.createQuery("from Emprunt").list();
            return liste;
        } finally {
            session.close();
        }
    }
    
    public static Emprunt trouverEmprunt(int idEmprunt) {
        Session session = sessionFactory.openSession();
        try {
            Emprunt emprunt = (Emprunt) session.get(Emprunt.class, idEmprunt);
            return emprunt;
        } finally {
            session.close();
        }
    }
    
    public static void supprimerEmprunt(int idEmprunt) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        try {
            Emprunt emprunt = (Emprunt) session.get(Emprunt.class, idEmprunt);
            if (emprunt != null) {
                // Si l'emprunt est en cours, remettre le livre en disponibilité
                if (emprunt.getStatut() == Emprunt.StatutEmprunt.en_cours) {
                    Livre livre = emprunt.getLivre();
                    livre.setNombreDisponibles(livre.getNombreDisponibles() + 1);
                    session.update(livre);
                }
                
                session.delete(emprunt);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public static List<Emprunt> listerEmpruntsEnRetard() {
        Session session = sessionFactory.openSession();
        try {
            List<Emprunt> liste = (List<Emprunt>) session.createQuery("from Emprunt e where e.statut = 'en_cours' and e.dateRetourPrevue < :aujourdhui")
                                        .setParameter("aujourdhui", new Date())
                                        .list();
            return liste;
        } finally {
            session.close();
        }
    }
    
    // Méthodes pour les Auteurs
    public static List<Auteur> listerAuteurs() {
        Session session = sessionFactory.openSession();
        try {
            List<Auteur> liste = (List<Auteur>) session.createQuery("from Auteur").list();
            return liste;
        } finally {
            session.close();
        }
    }
    
    // Méthodes pour les Catégories
    public static List<Categorie> listerCategories() {
        Session session = sessionFactory.openSession();
        try {
            List<Categorie> liste = (List<Categorie>) session.createQuery("from Categorie").list();
            return liste;
        } finally {
            session.close();
        }
    }
    
    // Statistiques
    public static List<Object[]> statistiquesLivres() {
        Session session = sessionFactory.openSession();
        try {
            List<Object[]> stats = session.createQuery(
                "select count(l), sum(l.nombreExemplaires), avg(l.prix) from Livre l").list();
            return stats;
        } finally {
            session.close();
        }
    }
    
    public static List<Object[]> statistiquesEmprunts() {
        Session session = sessionFactory.openSession();
        try {
            List<Object[]> stats = session.createQuery(
                "select count(e), sum(case when e.statut = 'en_cours' then 1 else 0 end), " +
                "sum(case when e.statut = 'en_retard' then 1 else 0 end) from Emprunt e").list();
            return stats;
        } finally {
            session.close();
        }
    }
    
    // Méthode pour fermer la session factory
    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
    
    public static List<Livre> listerLivresDisponibles() {
        Session session = sessionFactory.openSession();
        try {
            List<Livre> liste = (List<Livre>) session.createQuery("from Livre where nombreDisponibles > 0").list();
            return liste;
        } finally {
            session.close();
        }
    }
    
    public static List<Membre> listerMembresActifs() {
        Session session = sessionFactory.openSession();
        try {
            List<Membre> liste = (List<Membre>) session.createQuery("from Membre where statut = :statut")
                                        .setParameter("statut", Membre.StatutMembre.actif)
                                        .list();
            return liste;
        } finally {
            session.close();
        }
    }
} 
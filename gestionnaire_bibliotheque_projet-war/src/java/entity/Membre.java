package entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
@Entity
@Table(name = "membre", catalog = "gestionnaire_bibliotheque")
public class Membre implements Serializable {
    @Id
    @Column(name = "id_membre")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "numero_membre", nullable = false, length = 20, unique = true)
    private String numeroMembre;
    @Column(name = "nom_membre", nullable = false, length = 100)
    private String nom;
    @Column(name = "prenom_membre", nullable = false, length = 100)
    private String prenom;
    @Column(name = "email", length = 100, unique = true)
    private String email;
    @Column(name = "telephone", length = 20)
    private String telephone;
    @Column(name = "adresse", columnDefinition = "TEXT")
    private String adresse;
    @Column(name = "date_inscription", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dateInscription;
    @Enumerated(EnumType.STRING)
    @Column(name = "statut", columnDefinition = "ENUM('actif', 'suspendu', 'inactif') DEFAULT 'actif'")
    private StatutMembre statut;
    
    public enum StatutMembre {
        actif, suspendu, inactif
    }
    
    public Membre() {
        this.statut = StatutMembre.actif;
    }
    
    public Membre(String numeroMembre, String nom, String prenom, String email, 
                  String telephone, String adresse, Date dateInscription) {
        this.numeroMembre = numeroMembre;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.telephone = telephone;
        this.adresse = adresse;
        this.dateInscription = dateInscription;
        this.statut = StatutMembre.actif;
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNumeroMembre() { return numeroMembre; }
    public void setNumeroMembre(String numeroMembre) { this.numeroMembre = numeroMembre; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone; }
    public String getAdresse() { return adresse; }
    public void setAdresse(String adresse) { this.adresse = adresse; }
    public Date getDateInscription() { return dateInscription; }
    public void setDateInscription(Date dateInscription) { this.dateInscription = dateInscription; }
    public StatutMembre getStatut() { return statut; }
    public void setStatut(StatutMembre statut) { this.statut = statut; }
    
    @Override
    public String toString() {
        return prenom + " " + nom + " (" + numeroMembre + ")";
    }
} 
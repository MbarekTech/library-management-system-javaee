package entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
@Entity
@Table(name = "auteur", catalog = "gestionnaire_bibliotheque")
public class Auteur implements Serializable {
    @Id
    @Column(name = "id_auteur")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "nom_auteur", nullable = false, length = 100)
    private String nom;
    @Column(name = "prenom_auteur", length = 100)
    private String prenom;
    @Column(name = "nationalite", length = 50)
    private String nationalite;
    @Column(name = "date_naissance")
    @Temporal(TemporalType.DATE)
    private Date dateNaissance;
    @Column(name = "biographie", columnDefinition = "TEXT")
    private String biographie;
    
    public Auteur() {}
    
    public Auteur(String nom, String prenom, String nationalite, Date dateNaissance, String biographie) {
        this.nom = nom;
        this.prenom = prenom;
        this.nationalite = nationalite;
        this.dateNaissance = dateNaissance;
        this.biographie = biographie;
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }
    public String getNationalite() { return nationalite; }
    public void setNationalite(String nationalite) { this.nationalite = nationalite; }
    public Date getDateNaissance() { return dateNaissance; }
    public void setDateNaissance(Date dateNaissance) { this.dateNaissance = dateNaissance; }
    public String getBiographie() { return biographie; }
    public void setBiographie(String biographie) { this.biographie = biographie; }
    
    @Override
    public String toString() {
        return prenom + " " + nom;
    }
} 
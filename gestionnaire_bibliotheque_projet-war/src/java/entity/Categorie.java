package entity;
import javax.persistence.*;
import java.io.Serializable;
@Entity
@Table(name = "categorie", catalog = "gestionnaire_bibliotheque")
public class Categorie implements Serializable {
    @Id
    @Column(name = "id_categorie")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "nom_categorie", nullable = false, length = 50)
    private String nom;
    @Column(name = "description_categorie", columnDefinition = "TEXT")
    private String description;
    
    public Categorie() {}
    
    public Categorie(String nom, String description) {
        this.nom = nom;
        this.description = description;
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    @Override
    public String toString() {
        return nom;
    }
} 
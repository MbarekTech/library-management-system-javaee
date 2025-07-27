package entity;
import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
@Entity
@Table(name = "livre", catalog = "gestionnaire_bibliotheque")
public class Livre implements Serializable {
    @Id
    @Column(name = "id_livre")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "isbn", nullable = false, length = 20, unique = true)
    private String isbn;
    @Column(name = "titre", nullable = false, length = 200)
    private String titre;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_auteur")
    private Auteur auteur;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_categorie")
    private Categorie categorie;
    @Column(name = "annee_publication")
    private int anneePublication;
    @Column(name = "nombre_pages")
    private int nombrePages;
    @Column(name = "nombre_exemplaires")
    private int nombreExemplaires;
    @Column(name = "nombre_disponibles")
    private int nombreDisponibles;
    @Column(name = "prix", precision = 10, scale = 2)
    private BigDecimal prix;
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;
    
    public Livre() {
        this.nombreExemplaires = 1;
        this.nombreDisponibles = 1;
    }
    
    public Livre(String isbn, String titre, Auteur auteur, Categorie categorie, 
                 int anneePublication, int nombrePages, int nombreExemplaires, 
                 BigDecimal prix, String description) {
        this.isbn = isbn;
        this.titre = titre;
        this.auteur = auteur;
        this.categorie = categorie;
        this.anneePublication = anneePublication;
        this.nombrePages = nombrePages;
        this.nombreExemplaires = nombreExemplaires;
        this.nombreDisponibles = nombreExemplaires;
        this.prix = prix;
        this.description = description;
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }
    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }
    public Auteur getAuteur() { return auteur; }
    public void setAuteur(Auteur auteur) { this.auteur = auteur; }
    public Categorie getCategorie() { return categorie; }
    public void setCategorie(Categorie categorie) { this.categorie = categorie; }
    public int getAnneePublication() { return anneePublication; }
    public void setAnneePublication(int anneePublication) { this.anneePublication = anneePublication; }
    public int getNombrePages() { return nombrePages; }
    public void setNombrePages(int nombrePages) { this.nombrePages = nombrePages; }
    public int getNombreExemplaires() { return nombreExemplaires; }
    public void setNombreExemplaires(int nombreExemplaires) { this.nombreExemplaires = nombreExemplaires; }
    public int getNombreDisponibles() { return nombreDisponibles; }
    public void setNombreDisponibles(int nombreDisponibles) { this.nombreDisponibles = nombreDisponibles; }
    public BigDecimal getPrix() { return prix; }
    public void setPrix(BigDecimal prix) { this.prix = prix; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public boolean isDisponible() {
        return nombreDisponibles > 0;
    }
} 
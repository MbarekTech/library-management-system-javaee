package model;
import org.apache.struts.action.ActionForm;

public class LivreForm extends ActionForm {
    private String isbn;
    private String titre;
    private String auteurId;
    private String categorieId;
    private String anneePublication;
    private String nombrePages;
    private String nombreExemplaires;
    private String prix;
    private String description;
    private String idLivre;
    private String id;
    
    public LivreForm() {}
    
    // Getters and Setters
    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }
    
    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }
    
    public String getAuteurId() { return auteurId; }
    public void setAuteurId(String auteurId) { this.auteurId = auteurId; }
    
    public String getCategorieId() { return categorieId; }
    public void setCategorieId(String categorieId) { this.categorieId = categorieId; }
    
    public String getAnneePublication() { return anneePublication; }
    public void setAnneePublication(String anneePublication) { this.anneePublication = anneePublication; }
    
    public String getNombrePages() { return nombrePages; }
    public void setNombrePages(String nombrePages) { this.nombrePages = nombrePages; }
    
    public String getNombreExemplaires() { return nombreExemplaires; }
    public void setNombreExemplaires(String nombreExemplaires) { this.nombreExemplaires = nombreExemplaires; }
    
    public String getPrix() { return prix; }
    public void setPrix(String prix) { this.prix = prix; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public String getIdLivre() { return idLivre; }
    public void setIdLivre(String idLivre) { this.idLivre = idLivre; }
    
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
} 
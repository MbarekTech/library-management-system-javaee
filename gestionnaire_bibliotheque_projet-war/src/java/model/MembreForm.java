package model;
import org.apache.struts.action.ActionForm;

public class MembreForm extends ActionForm {
    private String numeroMembre;
    private String nom;
    private String prenom;
    private String email;
    private String telephone;
    private String adresse;
    private String statut;
    private String idMembre;
    private String id;
    
    public MembreForm() {}
    
    // Getters and Setters
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
    
    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut; }
    
    public String getIdMembre() { return idMembre; }
    public void setIdMembre(String idMembre) { this.idMembre = idMembre; }
    
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
} 
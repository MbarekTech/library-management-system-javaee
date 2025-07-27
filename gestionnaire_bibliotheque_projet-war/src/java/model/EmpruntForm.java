package model;

import org.apache.struts.action.ActionForm;

public class EmpruntForm extends ActionForm {
    private String livreId;
    private String membreId;
    private String dateEmprunt;
    private String dateRetourPrevue;
    private String id;
    private String statut;
    
    public EmpruntForm() {}
    
    public String getLivreId() { return livreId; }
    public void setLivreId(String livreId) { this.livreId = livreId; }
    
    public String getMembreId() { return membreId; }
    public void setMembreId(String membreId) { this.membreId = membreId; }
    
    public String getDateEmprunt() { return dateEmprunt; }
    public void setDateEmprunt(String dateEmprunt) { this.dateEmprunt = dateEmprunt; }
    
    public String getDateRetourPrevue() { return dateRetourPrevue; }
    public void setDateRetourPrevue(String dateRetourPrevue) { this.dateRetourPrevue = dateRetourPrevue; }
    
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    
    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut; }
} 
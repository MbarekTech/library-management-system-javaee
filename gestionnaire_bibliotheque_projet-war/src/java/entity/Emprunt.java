package entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
@Entity
@Table(name = "emprunt", catalog = "gestionnaire_bibliotheque")
public class Emprunt implements Serializable {
    @Id
    @Column(name = "id_emprunt")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_livre", nullable = false)
    private Livre livre;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_membre", nullable = false)
    private Membre membre;
    @Column(name = "date_emprunt", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dateEmprunt;
    @Column(name = "date_retour_prevue", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dateRetourPrevue;
    @Column(name = "date_retour_effective")
    @Temporal(TemporalType.DATE)
    private Date dateRetourEffective;
    @Enumerated(EnumType.STRING)
    @Column(name = "statut", columnDefinition = "ENUM('en_cours', 'retourne', 'en_retard') DEFAULT 'en_cours'")
    private StatutEmprunt statut;
    
    public enum StatutEmprunt {
        en_cours, retourne, en_retard
    }
    
    public Emprunt() {
        this.statut = StatutEmprunt.en_cours;
    }
    
    public Emprunt(Livre livre, Membre membre, Date dateEmprunt, Date dateRetourPrevue) {
        this.livre = livre;
        this.membre = membre;
        this.dateEmprunt = dateEmprunt;
        this.dateRetourPrevue = dateRetourPrevue;
        this.statut = StatutEmprunt.en_cours;
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Livre getLivre() { return livre; }
    public void setLivre(Livre livre) { this.livre = livre; }
    public Membre getMembre() { return membre; }
    public void setMembre(Membre membre) { this.membre = membre; }
    public Date getDateEmprunt() { return dateEmprunt; }
    public void setDateEmprunt(Date dateEmprunt) { this.dateEmprunt = dateEmprunt; }
    public Date getDateRetourPrevue() { return dateRetourPrevue; }
    public void setDateRetourPrevue(Date dateRetourPrevue) { this.dateRetourPrevue = dateRetourPrevue; }
    public Date getDateRetourEffective() { return dateRetourEffective; }
    public void setDateRetourEffective(Date dateRetourEffective) { this.dateRetourEffective = dateRetourEffective; }
    public StatutEmprunt getStatut() { return statut; }
    public void setStatut(StatutEmprunt statut) { this.statut = statut; }
    
    public boolean isEnRetard() {
        if (statut == StatutEmprunt.retourne) {
            return false;
        }
        Date aujourdhui = new Date();
        return aujourdhui.after(dateRetourPrevue);
    }
    
    @Override
    public String toString() {
        return "Emprunt de " + livre.getTitre() + " par " + membre.getNom() + " (" + statut + ")";
    }
} 
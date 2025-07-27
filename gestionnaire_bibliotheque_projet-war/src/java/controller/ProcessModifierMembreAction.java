package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import model.MembreForm;
import metier.GererBibliotheque;

public class ProcessModifierMembreAction extends Action {
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        MembreForm membreForm = (MembreForm) form;
        
        int id = Integer.parseInt(membreForm.getId());
        String nom = membreForm.getNom();
        String prenom = membreForm.getPrenom();
        String email = membreForm.getEmail();
        String telephone = membreForm.getTelephone();
        String adresse = membreForm.getAdresse();
        String statut = membreForm.getStatut();
        
        GererBibliotheque.modifierMembre(id, nom, prenom, email, telephone, adresse, statut);
        
        return mapping.findForward("success");
    }
} 
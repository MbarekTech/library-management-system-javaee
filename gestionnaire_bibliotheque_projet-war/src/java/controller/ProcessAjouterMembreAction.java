package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import model.MembreForm;
import metier.GererBibliotheque;

public class ProcessAjouterMembreAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        MembreForm membreForm = (MembreForm) form;
        String statut = membreForm.getStatut();
        if (statut == null) {
            statut = "actif";
        }
        GererBibliotheque.ajouterMembre(
            membreForm.getNom(),
            membreForm.getPrenom(),
            membreForm.getEmail(),
            membreForm.getTelephone(),
            membreForm.getAdresse(),
            statut
        );
        return mapping.findForward("success");
    }
} 
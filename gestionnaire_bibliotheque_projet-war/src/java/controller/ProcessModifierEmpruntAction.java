package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import model.EmpruntForm;
import metier.GererBibliotheque;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ProcessModifierEmpruntAction extends Action {
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        EmpruntForm empruntForm = (EmpruntForm) form;
        
        int id = Integer.parseInt(empruntForm.getId());
        int livreId = Integer.parseInt(empruntForm.getLivreId());
        int membreId = Integer.parseInt(empruntForm.getMembreId());
        String dateRetourPrevueStr = empruntForm.getDateRetourPrevue();
        String statut = empruntForm.getStatut();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dateRetourPrevue = sdf.parse(dateRetourPrevueStr);
        
        GererBibliotheque.modifierEmprunt(id, livreId, membreId, dateRetourPrevue, statut);
        
        return mapping.findForward("success");
    }
} 
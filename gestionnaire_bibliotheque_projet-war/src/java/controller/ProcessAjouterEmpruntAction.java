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

public class ProcessAjouterEmpruntAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        EmpruntForm empruntForm = (EmpruntForm) form;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dateRetourPrevue = sdf.parse(empruntForm.getDateRetourPrevue());
        GererBibliotheque.emprunterLivre(
            Integer.parseInt(empruntForm.getLivreId()),
            Integer.parseInt(empruntForm.getMembreId()),
            dateRetourPrevue
        );
        return mapping.findForward("success");
    }
} 
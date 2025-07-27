package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import metier.GererBibliotheque;
import java.util.List;
import entity.Livre;
import entity.Membre;

public class AjouterEmpruntAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Livre> livres = GererBibliotheque.listerLivresDisponibles();
        List<Membre> membres = GererBibliotheque.listerMembresActifs();
        request.setAttribute("livres", livres);
        request.setAttribute("membres", membres);
        return mapping.findForward("success");
    }
} 
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import metier.GererBibliotheque;
import java.util.List;
import entity.Emprunt;
import entity.Livre;
import entity.Membre;

public class ModifierEmpruntAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idParam = request.getParameter("id");
        int idEmprunt = Integer.parseInt(idParam);
        Emprunt emprunt = GererBibliotheque.trouverEmprunt(idEmprunt);
        List<Livre> livres = GererBibliotheque.listerLivres();
        List<Membre> membres = GererBibliotheque.listerMembres();
        request.setAttribute("emprunt", emprunt);
        request.setAttribute("livres", livres);
        request.setAttribute("membres", membres);
        return mapping.findForward("success");
    }
} 
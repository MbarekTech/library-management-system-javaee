package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import metier.GererBibliotheque;
import java.util.List;
import entity.Auteur;
import entity.Categorie;
import entity.Livre;

public class ModifierLivreAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idParam = request.getParameter("id");
        int idLivre = Integer.parseInt(idParam);
        Livre livre = GererBibliotheque.trouverLivre(idLivre);
        List<Auteur> auteurs = GererBibliotheque.listerAuteurs();
        List<Categorie> categories = GererBibliotheque.listerCategories();
        request.setAttribute("livre", livre);
        request.setAttribute("auteurs", auteurs);
        request.setAttribute("categories", categories);
        return mapping.findForward("success");
    }
} 
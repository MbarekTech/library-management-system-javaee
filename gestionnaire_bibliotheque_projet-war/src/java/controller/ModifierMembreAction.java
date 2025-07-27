package controller;

import entity.Membre;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import metier.GererBibliotheque;

public class ModifierMembreAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        Membre membre = GererBibliotheque.trouverMembre(id);
        request.setAttribute("membre", membre);
        return mapping.findForward("success");
    }
} 
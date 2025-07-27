package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import metier.GererBibliotheque;

public class SupprimerMembreAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        GererBibliotheque.supprimerMembre(id);
        return mapping.findForward("success");
    }
} 
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import metier.GererBibliotheque;

public class RetournerEmpruntAction extends Action {
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String empruntId = request.getParameter("id");
        ActionMessages messages = new ActionMessages();
        
        try {
            int id = Integer.parseInt(empruntId);
            GererBibliotheque.retournerLivre(id);
            
            messages.add("success", new ActionMessage("emprunt.retour.succes"));
            saveMessages(request, messages);
            
            return mapping.findForward("success");
            
        } catch (Exception e) {
            messages.add("error", new ActionMessage("emprunt.retour.erreur"));
            saveMessages(request, messages);
            return mapping.findForward("error");
        }
    }
} 
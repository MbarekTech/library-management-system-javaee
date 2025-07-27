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

public class ListeEmpruntsAction extends Action {
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        List<Emprunt> emprunts = GererBibliotheque.listerEmprunts();
        request.setAttribute("emprunts", emprunts);
        
        return mapping.findForward("success");
    }
} 
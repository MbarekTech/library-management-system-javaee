package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import model.LivreForm;
import metier.GererBibliotheque;

public class ProcessAjouterLivreAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        LivreForm livreForm = (LivreForm) form;
        
        // Handle optional numeric fields
        int anneePublication = 0;
        if (livreForm.getAnneePublication() != null && !livreForm.getAnneePublication().trim().isEmpty()) {
            anneePublication = Integer.parseInt(livreForm.getAnneePublication());
        }
        
        int nombrePages = 0;
        if (livreForm.getNombrePages() != null && !livreForm.getNombrePages().trim().isEmpty()) {
            nombrePages = Integer.parseInt(livreForm.getNombrePages());
        }
        
        int nombreExemplaires = 1;
        if (livreForm.getNombreExemplaires() != null && !livreForm.getNombreExemplaires().trim().isEmpty()) {
            nombreExemplaires = Integer.parseInt(livreForm.getNombreExemplaires());
        }
        
        double prix = 0.0;
        if (livreForm.getPrix() != null && !livreForm.getPrix().trim().isEmpty()) {
            prix = Double.parseDouble(livreForm.getPrix());
        }
        
        GererBibliotheque.ajouterLivre(
            livreForm.getIsbn(),
            livreForm.getTitre(),
            Integer.parseInt(livreForm.getAuteurId()),
            Integer.parseInt(livreForm.getCategorieId()),
            anneePublication,
            nombrePages,
            nombreExemplaires,
            prix,
            livreForm.getDescription()
        );
        return mapping.findForward("success");
    }
} 
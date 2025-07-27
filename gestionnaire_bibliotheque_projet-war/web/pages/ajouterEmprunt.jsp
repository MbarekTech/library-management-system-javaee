<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Emprunt - Projet fin session GC - 2024-2025</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="project-title">Projet fin session GC - 2024-2025</div>
            <div class="subtitle">GC M'barek Ben Daoud</div>
            <h1>Gestionnaire de Bibliothèque</h1>
        </div>
        
        <div class="nav-bar">
            <a href="index.jsp">Accueil</a>
            <a href="listeLivres.do">Livres</a>
            <a href="listeMembres.do">Membres</a>
            <a href="listeEmprunts.do">Emprunts</a>
        </div>
        
        <div class="content">
            <div class="page-header-centered">
                <h2 class="page-title">Créer un Nouvel Emprunt</h2>
                <p class="page-subtitle">Sélectionnez le livre et le membre</p>
            </div>
            
            <c:if test="${not empty error}">
                <div class="error">
                    <strong>Erreur:</strong> ${error}
                </div>
            </c:if>
            
            <c:if test="${not empty success}">
                <div class="success">
                    <strong>Succès:</strong> ${success}
                </div>
            </c:if>
            
     
            
            <form action="processAjouterEmprunt.do" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="livre">Livre *</label>
                        <select id="livre" name="livreId" required>
                            <option value="">Sélectionnez un livre</option>
                            <c:forEach var="livre" items="${livres}">
                                <option value="${livre.id}">${livre.titre} - ${livre.auteur.prenom} ${livre.auteur.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="membre">Membre *</label>
                        <select id="membre" name="membreId" required>
                            <option value="">Sélectionnez un membre</option>
                            <c:forEach var="membre" items="${membres}">
                                <option value="${membre.id}">${membre.nom} ${membre.prenom}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="dateEmprunt">Date d'emprunt *</label>
                        <input type="date" id="dateEmprunt" name="dateEmprunt" required />
                    </div>
                    <div class="form-group">
                        <label for="dateRetourPrevue">Date de retour prévue</label>
                        <input type="date" id="dateRetourPrevue" name="dateRetourPrevue" readonly />
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn">Créer l'Emprunt</button>
                    <a href="listeEmprunts.do" class="btn btn-secondary">Annuler</a>
                </div>
            </form>
            
            <div class="back-link">
                <a href="index.jsp">← Retour à l'accueil</a>
            </div>
        </div>
    </div>
    
    <script>
        // Auto-calculate return date (14 days after borrow date)
        document.getElementById('dateEmprunt').addEventListener('change', function() {
            const borrowDate = new Date(this.value);
            const returnDate = new Date(borrowDate);
            returnDate.setDate(borrowDate.getDate() + 14);
            
            const returnDateStr = returnDate.toISOString().split('T')[0];
            document.getElementById('dateRetourPrevue').value = returnDateStr;
        });
    </script>
</body>
</html> 
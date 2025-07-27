<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Membre - Projet fin session GC - 2024-2025</title>
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
                <h2 class="page-title">Ajouter un Nouveau Membre</h2>
                <p class="page-subtitle">Remplissez les informations du membre</p>
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
            
            <form action="processAjouterMembre.do" method="post">
                <div class="form-row">
              
                    <div class="form-group">
                        <label for="statut">Statut</label>
                        <select id="statut" name="statut">
                            <option value="actif" selected>Actif</option>
                            <option value="suspendu">Suspendu</option>
                            <option value="inactif">Inactif</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="nom">Nom *</label>
                        <input type="text" id="nom" name="nom" required />
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prénom *</label>
                        <input type="text" id="prenom" name="prenom" required />
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" id="email" name="email" required />
                    </div>
                    <div class="form-group">
                        <label for="telephone">Téléphone</label>
                        <input type="tel" id="telephone" name="telephone" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="adresse">Adresse</label>
                    <input type="text" id="adresse" name="adresse" />
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn">Ajouter le Membre</button>
                    <a href="listeMembres.do" class="btn btn-secondary">Annuler</a>
                </div>
            </form>
            
            <div class="back-link">
                <a href="index.jsp">← Retour à l'accueil</a>
            </div>
        </div>
    </div>
</body>
</html> 
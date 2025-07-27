<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Livres - Projet fin session GC - 2024-2025</title>
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
            <div class="page-header">
                <h2 class="page-title">Liste des Livres</h2>
                <a href="ajouterLivre.do" class="btn">Ajouter un Livre</a>
            </div>
            
            <div class="table-container">
                <c:choose>
                    <c:when test="${not empty livres}">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Titre</th>
                                    <th>Auteur</th>
                                    <th>Année</th>
                                    <th>ISBN</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="livre" items="${livres}">
                                    <tr>
                                        <td>${livre.id}</td>
                                        <td>${livre.titre}</td>
                                        <td>${livre.auteur.prenom} ${livre.auteur.nom}</td>
                                        <td>${livre.anneePublication}</td>
                                        <td>${livre.isbn}</td>
                                        <td>
                                            <a href="modifierLivre.do?id=${livre.id}" class="btn-warning">Modifier</a>
                                            <a href="supprimerLivre.do?id=${livre.id}" class="btn-primary" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce livre ?')">Supprimer</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-books">
                            <p>Aucun livre trouvé.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="back-link">
                <a href="index.jsp">← Retour à l'accueil</a>
            </div>
        </div>
    </div>
</body>
</html> 
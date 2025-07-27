<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Membres - Projet fin session GC - 2024-2025</title>
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
                <h2 class="page-title">Liste des Membres</h2>
                <a href="ajouterMembre.do" class="btn">Ajouter un Membre</a>
            </div>
            
            <div class="table-container">
                <c:choose>
                    <c:when test="${not empty membres}">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Email</th>
                                    <th>Téléphone</th>
                                    <th>Statut</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="membre" items="${membres}">
                                    <tr>
                                        <td>${membre.id}</td>
                                        <td>${membre.nom}</td>
                                        <td>${membre.prenom}</td>
                                        <td>${membre.email}</td>
                                        <td>${membre.telephone}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${membre.statut == 'actif'}">
                                                    <span class="status-actif">Actif</span>
                                                </c:when>
                                                <c:when test="${membre.statut == 'suspendu'}">
                                                    <span class="status-suspendu">Suspendu</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-inactif">Inactif</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="modifierMembre.do?id=${membre.id}" class="btn-warning">Modifier</a>
                                            <a href="supprimerMembre.do?id=${membre.id}" class="btn-primary" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce membre ?')">Supprimer</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-members">
                            <p>Aucun membre trouvé.</p>
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
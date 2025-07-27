<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Emprunts - Projet fin session GC - 2024-2025</title>
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
                <h2 class="page-title">Liste des Emprunts</h2>
                <a href="ajouterEmprunt.do" class="btn">Nouvel Emprunt</a>
            </div>
            
            <div class="table-container">
                <c:choose>
                    <c:when test="${not empty emprunts}">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Livre</th>
                                    <th>Membre</th>
                                    <th>Date d'emprunt</th>
                                    <th>Date de retour</th>
                                    <th>Statut</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="emprunt" items="${emprunts}">
                                    <tr>
                                        <td>${emprunt.id}</td>
                                        <td>${emprunt.livre.titre}</td>
                                        <td>${emprunt.membre.prenom} ${emprunt.membre.nom}</td>
                                        <td><fmt:formatDate value="${emprunt.dateEmprunt}" pattern="dd/MM/yyyy" /></td>
                                        <td><fmt:formatDate value="${emprunt.dateRetourPrevue}" pattern="dd/MM/yyyy" /></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${emprunt.statut == 'en_cours'}">
                                                    <span class="status-active">En cours</span>
                                                </c:when>
                                                <c:when test="${emprunt.statut == 'retourne'}">
                                                    <span class="status-returned">Retourné</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-overdue">En retard</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${emprunt.statut == 'en_cours'}">
                                                <a href="retournerEmprunt.do?id=${emprunt.id}" class="btn-success">Retourner</a>
                                            </c:if>
                                            <a href="modifierEmprunt.do?id=${emprunt.id}" class="btn-warning">Modifier</a>
                                            <a href="supprimerEmprunt.do?id=${emprunt.id}" class="btn-primary" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet emprunt ?')">Supprimer</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-emprunts">
                            <p>Aucun emprunt trouvé.</p>
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
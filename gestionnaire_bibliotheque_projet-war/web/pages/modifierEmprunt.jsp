<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier un Emprunt - Projet fin session GC - 2024-2025</title>
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
            
            <div class="page-header-centered">
                <h2 class="page-title">Modifier un Emprunt</h2>
                <p class="page-subtitle">Modifiez les informations de l'emprunt sélectionné</p>
            </div>
            
            <c:if test="${not empty emprunt}">
                <form action="processModifierEmprunt.do" method="post">
                    <input type="hidden" name="id" value="${emprunt.id}"/>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="livre">Livre *</label>
                            <select id="livre" name="livreId" required>
                                <option value="">Sélectionnez un livre</option>
                                <c:forEach var="livre" items="${livres}">
                                    <option value="${livre.id}" ${livre.id == emprunt.livre.id ? 'selected' : ''}>
                                        ${livre.titre} - ${livre.auteur.prenom} ${livre.auteur.nom}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="membre">Membre *</label>
                            <select id="membre" name="membreId" required>
                                <option value="">Sélectionnez un membre</option>
                                <c:forEach var="membre" items="${membres}">
                                    <option value="${membre.id}" ${membre.id == emprunt.membre.id ? 'selected' : ''}>
                                        ${membre.nom} ${membre.prenom}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="dateEmprunt">Date d'emprunt *</label>
                            <input type="date" id="dateEmprunt" name="dateEmprunt" value="<fmt:formatDate value="${emprunt.dateEmprunt}" pattern="yyyy-MM-dd" />" required />
                        </div>
                        <div class="form-group">
                            <label for="dateRetourPrevue">Date de retour prévue</label>
                            <input type="date" id="dateRetourPrevue" name="dateRetourPrevue" value="<fmt:formatDate value="${emprunt.dateRetourPrevue}" pattern="yyyy-MM-dd" />" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="statut">Statut</label>
                        <select id="statut" name="statut">
                            <option value="en_cours" ${emprunt.statut == 'en_cours' ? 'selected' : ''}>En cours</option>
                            <option value="retourne" ${emprunt.statut == 'retourne' ? 'selected' : ''}>Retourné</option>
                            <option value="en_retard" ${emprunt.statut == 'en_retard' ? 'selected' : ''}>En retard</option>
                        </select>
                    </div>
                    
                    <div class="form-actions">
                        <button type="submit" class="btn">Modifier l'Emprunt</button>
                        <a href="listeEmprunts.do" class="btn btn-secondary">Annuler</a>
                    </div>
                </form>
            </c:if>
            
            <div class="back-link">
                <a href="index.jsp">← Retour à l'accueil</a>
            </div>
        </div>
    </div>
</body>
</html> 
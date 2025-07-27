<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier un Livre - Projet fin session GC - 2024-2025</title>
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
                <h2 class="page-title">Modifier un Livre</h2>
                <p class="page-subtitle">Modifiez les informations du livre sélectionné</p>
            </div>
            
            <c:if test="${not empty livre}">
                <form action="processModifierLivre.do" method="post">
                    <input type="hidden" name="id" value="${livre.id}"/>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="titre">Titre *</label>
                            <input type="text" id="titre" name="titre" value="${livre.titre}" required />
                        </div>
                        <div class="form-group">
                            <label for="auteurId">Auteur *</label>
                            <select id="auteurId" name="auteurId" required>
                                <option value="">Sélectionnez un auteur</option>
                                <c:forEach var="auteur" items="${auteurs}">
                                    <option value="${auteur.id}" ${auteur.id == livre.auteur.id ? 'selected' : ''}>
                                        ${auteur.prenom} ${auteur.nom}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="isbn">ISBN *</label>
                            <input type="text" id="isbn" name="isbn" value="${livre.isbn}" required />
                        </div>
                        <div class="form-group">
                            <label for="categorieId">Catégorie *</label>
                            <select id="categorieId" name="categorieId" required>
                                <option value="">Sélectionnez une catégorie</option>
                                <c:forEach var="categorie" items="${categories}">
                                    <option value="${categorie.id}" ${categorie.id == livre.categorie.id ? 'selected' : ''}>
                                        ${categorie.nom}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="anneePublication">Année de publication</label>
                            <input type="number" id="anneePublication" name="anneePublication" value="${livre.anneePublication}" min="1900" max="2024" />
                        </div>
                        <div class="form-group">
                            <label for="nombrePages">Nombre de pages</label>
                            <input type="number" id="nombrePages" name="nombrePages" value="${livre.nombrePages}" min="1" />
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="nombreExemplaires">Nombre d'exemplaires</label>
                            <input type="number" id="nombreExemplaires" name="nombreExemplaires" value="${livre.nombreExemplaires}" min="1" />
                        </div>
                        <div class="form-group">
                            <label for="prix">Prix</label>
                            <input type="number" id="prix" name="prix" value="${livre.prix}" min="0" step="0.01" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" rows="4">${livre.description}</textarea>
                    </div>
                    
                    <div class="form-actions">
                        <button type="submit" class="btn">Modifier le Livre</button>
                        <a href="listeLivres.do" class="btn btn-secondary">Annuler</a>
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
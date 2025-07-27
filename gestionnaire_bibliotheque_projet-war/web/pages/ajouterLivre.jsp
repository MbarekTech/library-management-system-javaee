<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Livre - Projet fin session GC - 2024-2025</title>
    <meta charset="UTF-8">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
            padding: 20px;
            line-height: 1.6;
            color: #333;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .header {
            background: #2c3e50;
            color: white;
            padding: 40px 25px;
            text-align: center;
        }
        
        .project-title {
            background: transparent;
            padding: 0;
            margin-bottom: 20px;
        }
        
        .project-title h3 {
            font-size: 14px;
            margin-bottom: 10px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 2px;
            opacity: 0.8;
        }
        
        .project-title h4 {
            font-size: 12px;
            font-weight: 400;
            opacity: 0.7;
        }
        
        .header h1 {
            margin: 0 0 10px 0;
            font-size: 36px;
            font-weight: 700;
        }
        
        .header p {
            margin: 0;
            font-size: 20px;
            font-weight: 300;
        }
        
        .nav-bar {
            background: #495057;
            padding: 18px 0;
            text-align: center;
        }
        
        .nav-bar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 10px 18px;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .nav-bar a:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-1px);
        }
        
        .content {
            padding: 35px;
        }
        
        .page-header {
            text-align: center;
            margin-bottom: 35px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e9ecef;
        }
        
        .page-title {
            color: #2c3e50;
            font-size: 24px;
            margin-bottom: 12px;
            font-weight: 700;
        }
        
        .page-subtitle {
            color: #6c757d;
            font-size: 16px;
            font-weight: 500;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
            font-size: 14px;
        }
        
        input[type="text"], input[type="number"], select, textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e9ecef;
            font-size: 14px;
            box-sizing: border-box;
            border-radius: 6px;
            transition: all 0.3s ease;
        }
        
        input[type="text"]:focus, input[type="number"]:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
        }
        
        .btn {
            background: #667eea;
            color: white;
            padding: 14px 28px;
            border: none;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            display: inline-block;
            margin: 12px 8px;
            border-radius: 6px;
            transition: all 0.3s ease;
        }
        
        .btn:hover {
            background: #5a6fd8;
            transform: translateY(-1px);
        }
        
        .btn-secondary {
            background: #6c757d;
        }
        
        .btn-secondary:hover {
            background: #545b62;
        }
        
        .form-actions {
            text-align: center;
            margin-top: 35px;
            padding-top: 25px;
            border-top: 2px solid #e9ecef;
        }
        
        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            margin-bottom: 25px;
            border: 1px solid #f5c6cb;
            border-radius: 6px;
            font-weight: 500;
        }
        
        .success {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            margin-bottom: 25px;
            border: 1px solid #c3e6cb;
            border-radius: 6px;
            font-weight: 500;
        }
        
        .back-link {
            margin-top: 25px;
            text-align: center;
        }
        
        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .back-link a:hover {
            color: #5a6fd8;
        }
        
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .container {
                margin: 10px;
            }
            
            .content {
                padding: 25px;
            }
        }
    </style>
    <link rel="stylesheet" href="../style.css">
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
                <h2 class="page-title">Ajouter un Nouveau Livre</h2>
                <p class="page-subtitle">Remplissez les informations du livre</p>
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
            
            <form action="processAjouterLivre.do" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="titre">Titre *</label>
                        <input type="text" id="titre" name="titre" required />
                    </div>
                    <div class="form-group">
                        <label for="auteurId">Auteur *</label>
                        <select id="auteurId" name="auteurId" required>
                            <option value="">Sélectionnez un auteur</option>
                            <c:forEach var="auteur" items="${auteurs}">
                                <option value="${auteur.id}">${auteur.prenom} ${auteur.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="isbn">ISBN *</label>
                        <input type="text" id="isbn" name="isbn" required />
                    </div>
                    <div class="form-group">
                        <label for="categorieId">Catégorie *</label>
                        <select id="categorieId" name="categorieId" required>
                            <option value="">Sélectionnez une catégorie</option>
                            <c:forEach var="categorie" items="${categories}">
                                <option value="${categorie.id}">${categorie.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="anneePublication">Année de publication</label>
                        <input type="number" id="anneePublication" name="anneePublication" min="1900" max="2024" />
                    </div>
                    <div class="form-group">
                        <label for="nombrePages">Nombre de pages</label>
                        <input type="number" id="nombrePages" name="nombrePages" min="1" />
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="nombreExemplaires">Nombre d'exemplaires</label>
                        <input type="number" id="nombreExemplaires" name="nombreExemplaires" min="1" value="1" />
                    </div>
                    <div class="form-group">
                        <label for="prix">Prix</label>
                        <input type="number" id="prix" name="prix" min="0" step="0.01" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="4"></textarea>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn">Ajouter le Livre</button>
                    <a href="listeLivres.do" class="btn btn-secondary">Annuler</a>
                </div>
            </form>
            
            <div class="back-link">
                <a href="index.jsp">← Retour à l'accueil</a>
            </div>
        </div>
    </div>
</body>
</html> 
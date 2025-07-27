<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionnaire de Bibliothèque - Projet fin session GC - 2024-2025</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <div class="project-title">Projet fin session GC - 2024-2025</div>
            <div class="subtitle">GC M'barek Ben Daoud</div>
            <h1>Gestionnaire de Bibliothèque</h1>
        </header>
        
        <nav class="nav-bar">
            <a href="index.jsp">Accueil</a>
            <a href="listeLivres.do">Livres</a>
            <a href="listeMembres.do">Membres</a>
            <a href="listeEmprunts.do">Emprunts</a>
        </nav>
        
        <main class="content">
            <h2 class="page-subtitle">Système de Gestion Complet</h2>
            <p class="description">Application web pour la gestion complète d'une bibliothèque - Développée avec les technologies Java EE</p>
            
            <section class="nav-grid">
                <a href="listeLivres.do" class="nav-item">Gérer les Livres</a>
                <a href="listeMembres.do" class="nav-item">Gérer les Membres</a>
                <a href="listeEmprunts.do" class="nav-item">Gérer les Emprunts</a>
            </section>
            
            <section class="secondary-nav">
                <a href="ajouterLivre.do" class="secondary-item">Ajouter un Livre</a>
                <a href="ajouterMembre.do" class="secondary-item">Ajouter un Membre</a>
                <a href="ajouterEmprunt.do" class="secondary-item">Nouvel Emprunt</a>
            </section>
            
            <footer class="footer">
                <p>Système de Gestion de Bibliothèque - Projet fin de session - GC M'barek Ben Daoud</p>
            </footer>
        </main>
    </div>
</body>
</html> 
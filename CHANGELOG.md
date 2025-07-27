# Changelog

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
et ce projet adhère au [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-01-27

### Ajouté
- Système complet de gestion de bibliothèque
- Module de gestion des livres (CRUD complet)
- Module de gestion des membres (CRUD complet)
- Module de gestion des emprunts (CRUD complet)
- Base de données MySQL avec script d'initialisation
- Interface web responsive avec JSP et CSS
- Framework Struts 1.3 pour le MVC
- Integration Hibernate pour l'ORM
- Validation des formulaires
- Messages d'erreur et de succès internationalisés
- Configuration pour GlassFish Server
- Documentation complète (README, CONTRIBUTING)
- Licence MIT

### Fonctionnalités
- **Gestion des Livres**:
  - Ajout de nouveaux livres avec ISBN, titre, auteur, catégorie
  - Modification des informations des livres existants
  - Suppression de livres
  - Liste paginée des livres
  - Validation des champs obligatoires

- **Gestion des Membres**:
  - Enregistrement de nouveaux membres
  - Modification des profils membres
  - Gestion des statuts (actif, suspendu, inactif)
  - Liste des membres avec informations de contact
  - Validation email et téléphone

- **Gestion des Emprunts**:
  - Création d'emprunts avec sélection livre/membre
  - Modification des dates de retour
  - Retour de livres
  - Suivi des emprunts en cours et en retard
  - Historique des emprunts

### Technique
- Architecture Java EE 7 avec modules EJB et WAR
- Modèle de données relationnel optimisé
- Couche de persistance Hibernate
- Interface utilisateur JSP avec taglibs JSTL
- Configuration Struts avec actions et forwards
- Build automatisé avec Apache Ant
- Support multi-environnement

### Configuration
- Serveur d'application: GlassFish 4.1.1
- Base de données: MySQL 5.7+
- JDK: Java 8+
- IDE supporté: NetBeans 8.2

## [Unreleased]

### Prévu
- API REST pour intégration mobile
- Système de notifications par email
- Rapports et statistiques avancés
- Export des données (PDF, Excel)
- Interface d'administration
- Amélioration de la sécurité
- Tests automatisés étendus

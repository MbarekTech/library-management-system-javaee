# Gestionnaire de Bibliothèque Marocaine

Un système de gestion de bibliothèque développé en Java EE utilisant Struts 1.3, Hibernate et MySQL.

## 📋 Description

Ce projet est un système complet de gestion de bibliothèque permettant de gérer les livres, les membres et les emprunts. Il a été développé comme projet de fin de session pour la formation GC 2024-2025.

## 🚀 Fonctionnalités

### Gestion des Livres
- ✅ Ajouter de nouveaux livres
- ✅ Modifier les informations des livres
- ✅ Supprimer des livres
- ✅ Consulter la liste des livres
- ✅ Recherche par ISBN, titre, auteur ou catégorie

### Gestion des Membres
- ✅ Enregistrer de nouveaux membres
- ✅ Modifier les informations des membres
- ✅ Supprimer des membres
- ✅ Consulter la liste des membres
- ✅ Gestion des statuts (actif, suspendu, inactif)

### Gestion des Emprunts
- ✅ Créer de nouveaux emprunts
- ✅ Modifier les emprunts existants
- ✅ Retourner des livres
- ✅ Consulter la liste des emprunts
- ✅ Suivi des dates de retour

## 🛠️ Technologies Utilisées

- **Backend**: Java EE 7
- **Framework Web**: Apache Struts 1.3
- **ORM**: Hibernate 4.x
- **Base de données**: MySQL 5.7+
- **Serveur d'application**: GlassFish 4.1.1
- **Frontend**: JSP, HTML, CSS, JavaScript
- **Build Tool**: Apache Ant
- **IDE**: NetBeans 8.2

## 📁 Structure du Projet

```
library-management-system-javaee/
├── gestionnaire_bibliotheque_projet-ejb/    # Module EJB
│   ├── src/
│   │   └── java/
│   │       └── controller/                  # Contrôleurs métier
│   └── build.xml
├── gestionnaire_bibliotheque_projet-war/    # Module Web
│   ├── src/
│   │   ├── java/
│   │   │   ├── controller/                  # Actions Struts
│   │   │   ├── entity/                      # Entités JPA/Hibernate
│   │   │   ├── metier/                      # Couche métier
│   │   │   └── model/                       # Form Beans Struts
│   │   └── conf/                            # Fichiers de configuration
│   ├── web/
│   │   ├── pages/                           # Pages JSP
│   │   ├── WEB-INF/                         # Configuration web
│   │   └── style.css                        # Feuilles de style
│   └── build.xml
├── gestionnaire_bibliotheque.sql            # Script de base de données
└── build.xml                                # Build principal
```

## 🗄️ Modèle de Base de Données

### Tables principales:
- **livre**: Informations sur les livres (ISBN, titre, auteur, catégorie, etc.)
- **membre**: Informations sur les membres (nom, prénom, email, statut, etc.)
- **emprunt**: Gestion des emprunts (dates, statut, etc.)
- **auteur**: Informations sur les auteurs
- **categorie**: Catégories de livres

## ⚙️ Installation et Configuration

### Prérequis
- Java JDK 8 ou plus récent
- MySQL Server 5.7+
- GlassFish Server 4.1.1
- NetBeans IDE 8.2 (recommandé)

### Étapes d'installation

1. **Cloner le repository**
   ```bash
   git clone https://github.com/MbarekTech/library-management-system-javaee.git
   cd library-management-system-javaee
   ```

2. **Configuration de la base de données**
   ```bash
   # Créer la base de données MySQL
   mysql -u root -p < gestionnaire_bibliotheque.sql
   ```

3. **Configuration Hibernate**
   - Modifier le fichier `hibernate.cfg.xml` avec vos paramètres de connexion MySQL
   ```xml
   <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/gestionnaire_bibliotheque</property>
   <property name="hibernate.connection.username">votre_username</property>
   <property name="hibernate.connection.password">votre_password</property>
   ```

4. **Déploiement sur GlassFish**
   - Ouvrir le projet dans NetBeans
   - Configurer GlassFish Server
   - Build et déployer le projet

5. **Accès à l'application**
   ```
   http://localhost:8080/gestionnaire_bibliotheque_projet-war/
   ```

## 🎯 Utilisation

### Navigation principale
- **Accueil**: Vue d'ensemble du système
- **Gestion des Livres**: CRUD complet pour les livres
- **Gestion des Membres**: CRUD complet pour les membres
- **Gestion des Emprunts**: Création et suivi des emprunts

### Workflow typique
1. Ajouter des auteurs et catégories
2. Enregistrer des livres dans le système
3. Inscrire des membres
4. Créer des emprunts
5. Gérer les retours de livres

## 🧪 Tests

Le projet inclut des tests unitaires pour:
- Validation des entités
- Opérations CRUD de base
- Logique métier des emprunts

Pour exécuter les tests:
```bash
ant test
```

## 📝 Configuration Struts

Le fichier `struts-config.xml` définit:
- Les Form Beans pour la validation
- Les Actions pour le traitement des requêtes
- Les Forward pour la navigation
- Les messages d'internationalisation

## 🌐 Internationalisation

Le système supporte la localisation en français avec des fichiers de propriétés pour:
- Messages d'erreur et de validation
- Labels de l'interface utilisateur
- Messages de confirmation

## 🔧 Build et Déploiement

### Build avec Ant
```bash
# Build complet
ant clean build

# Build et déploiement
ant clean build deploy
```

### Structure EAR générée
- `gestionnaire_bibliotheque_projet.ear`
  - `gestionnaire_bibliotheque_projet-ejb.jar`
  - `gestionnaire_bibliotheque_projet-war.war`

## 🤝 Contribution

Les contributions sont les bienvenues ! Pour contribuer:

1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est distribué sous la licence MIT. Voir `LICENSE` pour plus d'informations.

## 👨‍💻 Auteur

**Projet Fin de Session - GC 2024-2025**

## 📞 Support

Pour toute question ou support, veuillez ouvrir une issue sur GitHub.

## 🔄 Roadmap

### Fonctionnalités futures
- [ ] API REST pour intégration mobile
- [ ] Système de notifications par email
- [ ] Rapports et statistiques avancés
- [ ] Interface d'administration avancée
- [ ] Intégration avec des systèmes de code-barres
- [ ] Export des données (PDF, Excel)

## 📊 Screenshots

### Page d'accueil
![Accueil](screenshots/accueil.png)

### Gestion des livres
![Livres](screenshots/livres.png)

### Gestion des emprunts
![Emprunts](screenshots/emprunts.png)

## ⚡ Performance

- Support de plusieurs centaines d'utilisateurs simultanés
- Base de données optimisée avec index appropriés
- Cache Hibernate configuré pour les requêtes fréquentes
- Interface responsive pour mobile et desktop

---

**Note**: Ce projet a été développé dans un contexte éducatif. Pour un usage en production, considérez les aspects de sécurité et de performance supplémentaires.

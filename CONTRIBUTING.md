# Guide de Contribution

Merci de votre intérêt pour contribuer au projet Gestionnaire de Bibliothèque Marocaine ! 🎉

## Comment contribuer

### Rapporter des bugs

1. Vérifiez que le bug n'a pas déjà été signalé dans les [Issues](../../issues)
2. Créez une nouvelle issue avec le template "Bug Report"
3. Incluez autant de détails que possible :
   - Version de Java utilisée
   - Version du serveur d'application
   - Étapes pour reproduire le bug
   - Comportement attendu vs comportement observé
   - Screenshots si applicable

### Suggérer des améliorations

1. Créez une issue avec le template "Feature Request"
2. Décrivez clairement la fonctionnalité souhaitée
3. Expliquez pourquoi cette fonctionnalité serait utile
4. Proposez une implémentation si possible

### Développer des fonctionnalités

1. **Fork** le repository
2. **Créez** une branche pour votre fonctionnalité :
   ```bash
   git checkout -b feature/ma-nouvelle-fonctionnalite
   ```
3. **Développez** votre fonctionnalité en suivant les standards du projet
4. **Testez** votre code
5. **Committez** vos changements :
   ```bash
   git commit -m "feat: ajouter nouvelle fonctionnalité"
   ```
6. **Push** vers votre fork :
   ```bash
   git push origin feature/ma-nouvelle-fonctionnalite
   ```
7. **Créez** une Pull Request

## Standards de code

### Java
- Suivez les conventions Java standard
- Utilisez des noms de variables et méthodes explicites
- Commentez le code complexe
- Respectez l'architecture MVC existante

### JSP/HTML
- Indentation cohérente (2 espaces)
- Utilisez les taglibs JSTL quand approprié
- Validez le HTML généré

### Base de données
- Utilisez des noms explicites pour les tables et colonnes
- Documentez les requêtes complexes
- Respectez les conventions de nommage existantes

## Structure des commits

Utilisez le format suivant pour vos messages de commit :

```
type(scope): description courte

Description plus détaillée si nécessaire.

Fixes #123
```

### Types de commits
- `feat`: nouvelle fonctionnalité
- `fix`: correction de bug
- `docs`: documentation seulement
- `style`: changements de formatage
- `refactor`: refactoring du code
- `test`: ajout ou modification de tests
- `chore`: tâches de maintenance

### Exemples
```bash
feat(emprunt): ajouter validation de date de retour
fix(livre): corriger problème d'affichage ISBN
docs(readme): mettre à jour guide d'installation
```

## Tests

- Ajoutez des tests pour les nouvelles fonctionnalités
- Assurez-vous que tous les tests passent avant de soumettre
- Tests unitaires pour la logique métier
- Tests d'intégration pour les contrôleurs

## Documentation

- Mettez à jour la documentation si nécessaire
- Commentez les méthodes publiques
- Documentez les configurations spéciales

## Code Review

Toutes les Pull Requests sont reviewées. Voici ce que nous regardons :

- **Fonctionnalité** : Le code fait-il ce qu'il est censé faire ?
- **Lisibilité** : Le code est-il facile à comprendre ?
- **Performance** : Y a-t-il des problèmes de performance ?
- **Sécurité** : Y a-t-il des vulnérabilités potentielles ?
- **Tests** : Les tests sont-ils appropriés et suffisants ?

## Questions ?

N'hésitez pas à :
- Ouvrir une issue pour poser une question
- Rejoindre les discussions existantes
- Consulter la documentation existante

Merci pour votre contribution ! 🚀

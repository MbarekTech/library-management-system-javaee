-- Script de création de la base de données pour le Gestionnaire de Bibliothèque Marocaine
-- Base de données: gestionnaire_bibliotheque

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS gestionnaire_bibliotheque;
USE gestionnaire_bibliotheque;

-- Table des catégories
CREATE TABLE IF NOT EXISTS categorie (
    id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    nom_categorie VARCHAR(50) NOT NULL,
    description_categorie TEXT
);

-- Table des auteurs
CREATE TABLE IF NOT EXISTS auteur (
    id_auteur INT AUTO_INCREMENT PRIMARY KEY,
    nom_auteur VARCHAR(100) NOT NULL,
    prenom_auteur VARCHAR(100),
    nationalite VARCHAR(50),
    date_naissance DATE,
    biographie TEXT
);

-- Table des livres
CREATE TABLE IF NOT EXISTS livre (
    id_livre INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    titre VARCHAR(200) NOT NULL,
    id_auteur INT,
    id_categorie INT,
    annee_publication INT,
    nombre_pages INT,
    nombre_exemplaires INT DEFAULT 1,
    nombre_disponibles INT DEFAULT 1,
    prix DECIMAL(10,2),
    description TEXT,
    FOREIGN KEY (id_auteur) REFERENCES auteur(id_auteur),
    FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
);

-- Table des membres
CREATE TABLE IF NOT EXISTS membre (
    id_membre INT AUTO_INCREMENT PRIMARY KEY,
    numero_membre VARCHAR(20) NOT NULL UNIQUE,
    nom_membre VARCHAR(100) NOT NULL,
    prenom_membre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telephone VARCHAR(20),
    adresse TEXT,
    date_inscription DATE NOT NULL,
    statut ENUM('actif', 'suspendu', 'inactif') DEFAULT 'actif'
);

-- Table des emprunts
CREATE TABLE IF NOT EXISTS emprunt (
    id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    id_livre INT NOT NULL,
    id_membre INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour_prevue DATE NOT NULL,
    date_retour_effective DATE,
    statut ENUM('en_cours', 'retourne', 'en_retard') DEFAULT 'en_cours',
    FOREIGN KEY (id_livre) REFERENCES livre(id_livre),
    FOREIGN KEY (id_membre) REFERENCES membre(id_membre)
);

-- Insertion des données de test avec des données marocaines

-- Catégories
INSERT INTO categorie (nom_categorie, description_categorie) VALUES
('Littérature Marocaine', 'Œuvres d''auteurs marocains'),
('Histoire du Maroc', 'Livres sur l''histoire du Maroc'),
('Cuisine Marocaine', 'Recettes et traditions culinaires'),
('Poésie Arabe', 'Poésie classique et moderne'),
('Religion et Spiritualité', 'Livres sur l''islam et la spiritualité'),
('Géographie', 'Géographie du Maroc et du monde'),
('Sciences', 'Livres scientifiques et techniques'),
('Art et Culture', 'Art, musique et culture marocaine');

-- Auteurs
INSERT INTO auteur (nom_auteur, prenom_auteur, nationalite, date_naissance, biographie) VALUES
('Ben Jelloun', 'Tahar', 'Marocaine', '1944-03-01', 'Écrivain marocain de renommée internationale'),
('Chraïbi', 'Driss', 'Marocaine', '1926-07-15', 'Pionnier de la littérature marocaine moderne'),
('Khatibi', 'Abdelkébir', 'Marocaine', '1938-02-11', 'Écrivain et sociologue marocain'),
('Mernissi', 'Fatima', 'Marocaine', '1940-09-27', 'Sociologue et féministe marocaine'),
('Al-Maghili', 'Muhammad', 'Marocaine', '1440-01-01', 'Théologien et érudit marocain du XVe siècle'),
('Ibn Battuta', 'Muhammad', 'Marocaine', '1304-02-24', 'Explorateur et voyageur marocain'),
('Al-Fassi', 'Allal', 'Marocaine', '1910-01-10', 'Leader nationaliste et écrivain marocain'),
('Zafzaf', 'Muhammad', 'Marocaine', '1945-01-01', 'Écrivain marocain contemporain');

-- Livres
INSERT INTO livre (isbn, titre, id_auteur, id_categorie, annee_publication, nombre_pages, nombre_exemplaires, nombre_disponibles, prix, description) VALUES
('978-2-07-040123-4', 'L''Enfant de Sable', 1, 1, 1985, 320, 3, 3, 15.50, 'Roman de Tahar Ben Jelloun'),
('978-2-07-040124-1', 'La Nuit Sacrée', 1, 1, 1987, 280, 2, 2, 14.00, 'Suite de L''Enfant de Sable'),
('978-2-07-040125-8', 'Le Passé Simple', 2, 1, 1954, 240, 2, 2, 12.50, 'Premier roman de Driss Chraïbi'),
('978-2-07-040126-5', 'La Civilisation, Ma Mère!', 2, 1, 1972, 200, 3, 3, 13.00, 'Roman autobiographique'),
('978-2-07-040127-2', 'Le Livre du Sang', 3, 1, 1979, 180, 2, 2, 11.50, 'Essai de Abdelkébir Khatibi'),
('978-2-07-040128-9', 'Rêves de Femmes', 4, 1, 1994, 220, 2, 2, 12.00, 'Recueil de contes de Fatima Mernissi'),
('978-2-07-040129-6', 'Histoire du Maroc', 5, 2, 2000, 450, 1, 1, 25.00, 'Histoire complète du Maroc'),
('978-2-07-040130-2', 'Cuisine Marocaine Traditionnelle', 6, 3, 1998, 180, 2, 2, 18.50, 'Recettes traditionnelles'),
('978-2-07-040131-9', 'Poèmes du Désert', 7, 4, 1995, 120, 3, 3, 10.00, 'Poésie arabe classique'),
('978-2-07-040132-6', 'L''Islam et la Modernité', 8, 5, 2005, 300, 2, 2, 16.00, 'Réflexions sur l''islam contemporain');

-- Membres
INSERT INTO membre (numero_membre, nom_membre, prenom_membre, email, telephone, adresse, date_inscription, statut) VALUES
('MEM001', 'Alaoui', 'Fatima', 'fatima.alaoui@email.com', '0612345678', '123 Rue Hassan II, Casablanca', '2024-01-15', 'actif'),
('MEM002', 'Benali', 'Ahmed', 'ahmed.benali@email.com', '0623456789', '456 Avenue Mohammed V, Rabat', '2024-02-20', 'actif'),
('MEM003', 'Tazi', 'Amina', 'amina.tazi@email.com', '0634567890', '789 Boulevard Mohammed VI, Marrakech', '2024-03-10', 'actif'),
('MEM004', 'El Fassi', 'Karim', 'karim.elfassi@email.com', '0645678901', '321 Rue de la Liberté, Fès', '2024-01-30', 'actif'),
('MEM005', 'Bennani', 'Leila', 'leila.bennani@email.com', '0656789012', '654 Place Jemaa el-Fna, Marrakech', '2024-02-15', 'suspendu'),
('MEM006', 'Cherkaoui', 'Youssef', 'youssef.cherkaoui@email.com', '0667890123', '987 Avenue des Nations Unies, Agadir', '2024-03-05', 'actif'),
('MEM007', 'Idrissi', 'Nadia', 'nadia.idrissi@email.com', '0678901234', '147 Rue Ibn Khaldoun, Tanger', '2024-01-25', 'actif'),
('MEM008', 'Mouline', 'Hassan', 'hassan.mouline@email.com', '0689012345', '258 Boulevard Mohammed V, Meknès', '2024-02-28', 'inactif');

-- Emprunts (quelques exemples)
INSERT INTO emprunt (id_livre, id_membre, date_emprunt, date_retour_prevue, statut) VALUES
(1, 1, '2024-06-01', '2024-06-15', 'en_cours'),
(3, 2, '2024-05-20', '2024-06-03', 'en_retard'),
(5, 3, '2024-06-05', '2024-06-19', 'en_cours'),
(7, 4, '2024-05-15', '2024-05-29', 'retourne'),
(9, 6, '2024-06-10', '2024-06-24', 'en_cours');

-- Mise à jour du nombre d'exemplaires disponibles pour les livres empruntés
UPDATE livre SET nombre_disponibles = nombre_disponibles - 1 WHERE id_livre IN (1, 3, 5, 9);
UPDATE livre SET nombre_disponibles = nombre_disponibles + 1 WHERE id_livre = 7;

COMMIT; 
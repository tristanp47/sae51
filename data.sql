CREATE DATABASE gestion_parc_informatique;
USE gestion_parc_informatique;

CREATE TABLE `Techniciens` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `Nom` varchar(255)
);

CREATE TABLE `Utilisateurs` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `Nom` varchar(255),
  `Droit` varchar(255)
);

CREATE TABLE `Maintenances` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `DateDebut` date,
  `DateFin` date,
  `Actions` varchar(255),
  `TechnicienID` int
);

CREATE TABLE `Machines` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `DateAchat` date,
  `TailleDisque` varchar(255),
  `RAM` varchar(255),
  `UtilisateurID` int,
  `MaintenanceID` int,
  `MarquesID` int,
  `LogicielsID` int,
  `OS` varchar(255)
);

CREATE TABLE `Logiciels` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `Nom` varchar(255),
  `Version` varchar(255),
  `Licence` varchar(255)
);

CREATE TABLE `Marques` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `Marques` varchar(255)
);

ALTER TABLE `Maintenances` ADD FOREIGN KEY (`TechnicienID`) REFERENCES `Techniciens` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`UtilisateurID`) REFERENCES `Utilisateurs` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`MaintenanceID`) REFERENCES `Maintenances` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`MarquesID`) REFERENCES `Marques` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`LogicielsID`) REFERENCES `Logiciels` (`ID`);

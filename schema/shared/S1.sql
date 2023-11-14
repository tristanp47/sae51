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
  `Marque` varchar(255),
  `TailleDisque` varchar(255),
  `RAM` varchar(255),
  `UtilisateurID` int,
  `MaintenanceID` int
);

CREATE TABLE `Logiciels` (
  `Version` varchar(255),
  `Licence` varchar(255),
  `MachineID` int
);

ALTER TABLE `Maintenances` ADD FOREIGN KEY (`TechnicienID`) REFERENCES `Techniciens` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`UtilisateurID`) REFERENCES `Utilisateurs` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`MaintenanceID`) REFERENCES `Maintenances` (`ID`);

ALTER TABLE `Logiciels` ADD FOREIGN KEY (`MachineID`) REFERENCES `Machines` (`ID`);


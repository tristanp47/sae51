#!/usr/bin/bash
if [ "$1" = "1" ];
then
	echo "Requête 1 liste de toutes les machines de marque HP"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Machines.* FROM Machines JOIN Marques ON Machines.MarquesID = Marques.ID WHERE Marques.Marques = 'HP';"
fi

if [ "$1" = "2" ];
then
	echo "Requête 2 liste de toutes les machines acheté entre 2018 et 2020"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT * FROM Machines WHERE YEAR(DateAchat) BETWEEN 2018 AND 2020;"
fi

if [ "$1" = "3" ];
then
	echo "Requête 3 liste de toutes les machines HP acheté entre 2019 et 2020"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Machines.* FROM Machines
	JOIN Marques ON Machines.MarquesID = Marques.ID WHERE YEAR(DateAchat) BETWEEN 2019 AND 2020 AND Marques.Marques = 'HP';"
fi

if [ "$1" = "4" ];
then
	echo "Requête 4 liste le nombres de Machines de la marque DELL"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT COUNT(*) FROM Machines JOIN Marques ON Machines.MarquesID = Marques.ID WHERE Marques.Marques = 'DELL';"
fi

if [ "$1" = "5" ];
then
	echo "Requête 5 liste de toutes les Machines qui ont entre 4GB et 8GB de RAM"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT * FROM Machines WHERE RAM BETWEEN 4 AND 8;"
fi

if [ "$1" = "6" ];
then
	echo "Requête 6 liste de tous les logiciels de la machine 123"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Logiciels.Nom FROM Logiciels JOIN Machines ON Logiciels.ID = Machines.LogicielsID WHERE Machines.ID = 123;"
fi

if [ "$1" = "7" ];
then
	echo "Requête 7 liste de tous les logiciels de la machine attribuée à Leo Jones"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Logiciels.*, Utilisateurs.Nom FROM Logiciels 
	JOIN Machines ON Logiciels.ID = Machines.LogicielsID
	JOIN Utilisateurs ON Machines.UtilisateurID = Utilisateurs.ID WHERE Utilisateurs.Nom = 'Leo Jones';" 
fi

if [ "$1" = "8" ];
then
	echo "Requête 8 liste des utilisateurs utilisant une machine de la marque HP"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Utilisateurs.* FROM Utilisateurs
	JOIN Machines ON Utilisateurs.ID = Machines.UtilisateurID
	JOIN Marques ON Machines.MarquesID = Marques.ID WHERE Marques.Marques = 'HP';"
fi

if [ "$1" = "9" ];
then
	echo "Requête 9 liste des utilisateurs utilisant une machine de la marque HP ainsi et qui contient l'OS Windows 10"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Utilisateurs.*, Machines.OS, Marques.Marques FROM Utilisateurs
	JOIN Machines ON Utilisateurs.ID = Machines.UtilisateurID
	JOIN Marques ON Machines.MarquesID = Marques.ID WHERE Marques.Marques = 'HP' AND Machines.OS = 'Windows 10';"
fi

if [ "$1" = "10" ];
then
	echo "Requête 10 liste des machines sur lesquelles il y a eu une intervention entre le 01/04/2022 et le 31/07/2022"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Machines.* FROM Machines
	JOIN Maintenances ON Machines.MaintenanceID = Maintenances.ID
	JOIN Techniciens ON Maintenances.TechnicienID = Techniciens.ID WHERE Maintenances.DateDebut BETWEEN '2022-04-01' AND '2022-07-31';"
fi

if [ "$1" = "11" ];
then
	echo "Requête 11 liste des machines sur lesquelles le technicien Alice Johnson a fait de la maintenance"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Machines.*, Techniciens.Nom FROM Machines
	JOIN Maintenances ON Machines.MaintenanceID = Maintenances.ID
	JOIN Techniciens ON Maintenances.TechnicienID = Techniciens.ID
	WHERE Techniciens.Nom = 'Alice Johnson';"
fi

if [ "$1" = "12" ];
then
	echo "Requête 12 liste de machines sur lesquelles le technicien Alice Johnson a fait de la maintenance entre Avril et Juillet 2022"
	mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
	-e "SELECT Machines.*, Techniciens.Nom FROM Machines
	JOIN Maintenances ON Machines.MaintenanceID = Maintenances.ID
	JOIN Techniciens ON Maintenances.TechnicienID = Techniciens.ID
	WHERE Techniciens.Nom = 'Alice Johnson' AND Maintenances.DateDebut BETWEEN '2022-04-01' AND '2022-07-31';"
fi

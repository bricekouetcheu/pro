CREATE TABLE Patient (
    idPatient CHAR(100) NOT NULL,
	nomPatient CHAR(15) NULL,
	prenomPatient CHAR(15) NULL,
	sexe CHAR(1) NULL,
	dateDeNaissance CHAR(20) NULL,
	dateAdmission CHAR(20) NULL,
	numeroGSM CHAR(15) NULL,
	symptomes CHAR(3) NULL,
	villeId CHAR(6) NOT NULL,
	idHopital CHAR(6) NOT NULL,
	CONSTRAINT pkPatient PRIMARY KEY ( idPatient ),
    constraint fkPatient FOREIGN KEY (villeId) references Ville(villeId),
    constraint fkpat FOREIGN KEY (idHopital) references Hopital(idHopital)
) 

CREATE TABLE Hopital (
	idHopital CHAR(6) NOT NULL,
	nomHopital CHAR(40) NULL,
    motDePasse CHAR(15) NOT NULL,
	villeId CHAR(6) NOT NULL,
	CONSTRAINT "pkHopital" PRIMARY KEY ( "idHopital" ASC ),
    constraint fkHop FOREIGN KEY villeId references Ville(villeId)
)


CREATE TABLE Ville (
	villeId CHAR(6) NOT NULL,
	illeNom CHAR(10) NULL,
	CONSTRAINT "pkVille" PRIMARY KEY ( "villeId" ASC )
) 

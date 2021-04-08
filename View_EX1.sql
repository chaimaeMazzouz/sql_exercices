Create database Gestion_Notes

use Gestion_Notes

create table ETUDIANT(
NETUDIANT int primary key,
Nom varchar(20),
Prenom varchar(20));

create table MATIERE(
CodeMat varchar(10) primary key,
LibelleMat varchar(20),
CoeffMat int);

create table EVALUER(
NETUDIANT int,
CodeMat varchar(10),
Date_ Date,
Note float,
CONSTRAINT FK_NETUDIANT FOREIGN KEY (NETUDIANT)
    REFERENCES ETUDIANT(NETUDIANT),
CONSTRAINT FK_CodeMat FOREIGN KEY (CodeMat)
    REFERENCES MATIERE(CodeMat),	
Primary key(NETUDIANT,CodeMat)
);

insert into ETUDIANT values(1,'mazzouz','chaimae')
insert into ETUDIANT values(2,'alaoui','salma')
insert into ETUDIANT values(3,'fatihi','laila')

insert into MATIERE values('101','HTML',3)
insert into MATIERE values('202','SQL',4)
insert into MATIERE values('303','JAVA',5)

insert into EVALUER values(1,'202','2021-01-01',16),(1,'101','2021-01-01',15),(1,'303','2021-01-01',17)
insert into EVALUER values(2,'202','2021-01-01',14),(2,'101','2021-01-01',16),(2,'303','2021-01-01',10)
insert into EVALUER values(3,'202','2021-01-01',15),(3,'101','2021-01-01',13),(3,'303','2021-01-01',12)

--Q1
Select count(*) as 'Nombre Etudiants' from Etudiant 

--Q2
Select min(note) as 'basse Note', max(note) as 'Haute note' from evaluer

--Q3
Create View MGETU
as
Select etudiant.Netudiant, MATIERE.LibelleMat, AVG(evaluer.note) as 'MoyEtuMat'
from Evaluer, matiere, etudiant
where evaluer.codeMat= matiere.codeMat AND evaluer.Netudiant=Etudiant.Netudiant
Group by Etudiant.Netudiant, matiere.LibelleMat

--Q4
Select libelleMat, AVG(MoyEtuMat)
from MGETU
Group by LibelleMat

--Q5
Create View MGETUQ5
as 
Select Netudiant, SUM(MoyEtuMat*CoeffMat)/SUM(CoeffMat) As 'MoyGen'
From MGETU,Matiere
Where Matiere.libelleMat=MGETU.libelleMat
GROUP BY Netudiant
--Q6

Select AVG(MoyGen) as 'MoyGenPro' from MGETUQ5

--Q7
Select etudiant.NETUDIANT, nom, Prenom, MoyGen 
from MGETUQ5, etudiant
where etudiant.Netudiant= MGETUQ5.Netudiant 
		and MoyGen>=(Select AVG(MoyGen)from MGETUQ5)
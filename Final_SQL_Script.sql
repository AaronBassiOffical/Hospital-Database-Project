REM   Script: DBS Coursework
REM   Coursework

CREATE TABLE Countries (id number(10), Name varchar2(255), "Population No" number(10), "Health Minister" varchar2(255), "Health Minister Statements" blob, PRIMARY KEY (id));
CREATE TABLE Counties (id number(10), Name varchar2(255), "Population No" number(10), Countriesid number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Districts (id number(10), Name varchar2(255), "Population No" number(10), Countiesid number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Appointment (id number(10), Patientid number(10) NOT NULL, Start_Time timestamp(0), End_Time timestamp(0), PRIMARY KEY (id));
CREATE TABLE "Waiting List" (id number(10), Position number(10) UNIQUE, PRIMARY KEY (id));
CREATE TABLE Operations (id number(10), "Operation Type" varchar2(255), "Waiting Listid" number(10) NOT NULL, Patientid number(10) NOT NULL, Appointmentid number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Patient (id number(10), Forename varchar2(255) NOT NULL, Surname varchar2(255) NOT NULL, "Date of Birth" date, Phone varchar2(255), "Employment Status" varchar2(255), "Age Group" varchar2(255), "Address Line 1" varchar2(255), "Address Line 2" number(10), Postcode varchar2(255), Countiesid number(10) NOT NULL, Districtsid number(10) NOT NULL, Countriesid number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE "Patient_Waiting List" (Patientid number(10) NOT NULL, "Waiting Listid" number(10) NOT NULL, PRIMARY KEY (Patientid, "Waiting Listid"));
ALTER TABLE Counties ADD CONSTRAINT FKCounties FOREIGN KEY (Countriesid) REFERENCES Countries (id);
ALTER TABLE Districts ADD CONSTRAINT FKDistricts FOREIGN KEY (Countiesid) REFERENCES Counties (id);
ALTER TABLE Operations ADD CONSTRAINT FKOperations FOREIGN KEY ("Waiting Listid") REFERENCES "Waiting List" (id);
ALTER TABLE Operations ADD CONSTRAINT FKOperations2 FOREIGN KEY (Appointmentid) REFERENCES Appointment (id);
ALTER TABLE Operations ADD CONSTRAINT FKOperations3 FOREIGN KEY (Patientid) REFERENCES Patient (id);
ALTER TABLE Appointment ADD CONSTRAINT FKAppointment FOREIGN KEY (Patientid) REFERENCES Patient (id);
ALTER TABLE Patient ADD CONSTRAINT FKPatient FOREIGN KEY (Countiesid) REFERENCES Counties (id);
ALTER TABLE Patient ADD CONSTRAINT FKPatient2 FOREIGN KEY (Districtsid) REFERENCES Districts (id);
ALTER TABLE Patient ADD CONSTRAINT FKPatient3 FOREIGN KEY (Countriesid) REFERENCES Countries (id);
ALTER TABLE "Patient_Waiting List" ADD CONSTRAINT FKPatient_Wa FOREIGN KEY (Patientid) REFERENCES Patient (id);
ALTER TABLE "Patient_Waiting List" ADD CONSTRAINT FKPatient_Wa2 FOREIGN KEY ("Waiting Listid") REFERENCES "Waiting List" (id);


INSERT INTO Countries VALUES ( 1, 'England', 50000000,' Rt Hon Steve',NULL);
INSERT INTO Countries VALUES ( 2, 'Wales', 3000000,'Y Gweinidog',NULL );
INSERT INTO Countries VALUES ( 3, 'Scottland', 5000000, 'Humza Yousaf',NULL );
INSERT INTO Countries VALUES ( 4, 'Northern Ireland', 1000000,'Stephen Donnelly',NULL );


INSERT INTO Counties VALUES ( 1, 'Durham',527035,1);
INSERT INTO Counties VALUES ( 2, 'West Yorkshire',2325000,1);
INSERT INTO Counties VALUES ( 3, 'Bristol',467000,1);
INSERT INTO Counties VALUES ( 4, 'Cornwall',565968,1);
INSERT INTO Counties VALUES ( 5, 'Greater London',9000000,1);
INSERT INTO Counties VALUES ( 6, 'Merseyside',1400000,1);
INSERT INTO Counties VALUES ( 7, 'West Midlands',3000000,1);
INSERT INTO Counties VALUES ( 8, 'Buckinghamshire',550000,1);
INSERT INTO Counties VALUES ( 9, 'South Yorkshire',1400000,1);
INSERT INTO Counties VALUES ( 10, 'Greater Manchester',2800000,1);
INSERT INTO Counties VALUES ( 11, 'South Glamorgan',500000,2);
INSERT INTO Counties VALUES ( 12, 'Antrim',600000,4);
INSERT INTO Counties VALUES ( 13, 'City of Edinburgh',550000,3);


INSERT INTO Districts VALUES ( 1, 'Birmingham', 1141816, 7);
INSERT INTO Districts VALUES ( 2, 'Leeds', 793139, 2);
INSERT INTO Districts VALUES ( 3, 'Barnet', 395869, 5);
INSERT INTO Districts VALUES ( 4, 'Manchester', 552858, 10);
INSERT INTO Districts VALUES ( 5, 'Sheffield', 584853, 9);
INSERT INTO Districts VALUES ( 6, 'Cornwall', 3000000, 4);
INSERT INTO Districts VALUES ( 7, 'Buckinghamshire', 543973, 8);
INSERT INTO Districts VALUES ( 8, 'County Durham', 530094, 1);
INSERT INTO Districts VALUES ( 9, 'Liverpool', 498042, 6);
INSERT INTO Districts VALUES ( 10, 'Bristol', 463377, 3);
INSERT INTO Districts VALUES ( 11, 'Cardiff', 485000, 11);
INSERT INTO Districts VALUES ( 12, 'Belfast', 341877, 12);
INSERT INTO Districts VALUES ( 13, 'Edinburgh', 548000, 13);


INSERT INTO Patient VALUES (1, 'John', 'Smith', '19-MAY-1994', '07985043567', 'Employed', 'Adult', 'District Street',50,'NE140LL',12,12,4);
INSERT INTO Patient VALUES (2, 'Ella', 'Brown', '10-MAR-1990', '07955078687', 'Employed', 'Adult', 'Abba Street',67,'SE19 W9L',3,10,1);
INSERT INTO Patient VALUES (3, 'Ellen', 'Grey', '05-APR-2010', '07955078687', 'Unemployed', 'Child', 'Loran Street',97,'SW19 G1R',13,13,3);
INSERT INTO Patient VALUES (4, 'Andrew', 'Fish', '11-JUL-1993', '07955074685', 'Unemployed', 'Adult', 'Grey Street',28,'SW24 T3R',11,11,2);
INSERT INTO Patient VALUES (5, 'Mobby', 'Lobby', '08-APR-1999', '07955068687', 'Unemployed', 'Adult', 'Mission Street', 78,'NW9 SE1',6,9,1);
INSERT INTO Patient VALUES (6,'Bob','Bobby','01-APR-2002','07951242953','Employed','Adult','Broadway Street',70,'NW2 2BR',5,3,1);
INSERT INTO Patient VALUES (7,'Adam','Henderson','04-JUL-1995','07951242952','Unemployed','Adult','Edgware Street',42,'SW10 0NE',8,7,1);
INSERT INTO Patient VALUES (8,'Oliver','Mason','23-JAN-2009','07951242654','Unemployed','Child','Stone Street',21,'NE12 0BJ',2,2,1);
INSERT INTO Patient VALUES (9,'Macy','Showman','29-SEP-2001','07951244958','Employed','Adult','Hall Street',94,'NE14 A12',9,5,1);
INSERT INTO Patient VALUES (10,'Nader','Akar','14-NOV-1991','07958344143','Unemployed','Adult','Tottenham Street',23,'SE21 0L2',4,6,1);


INSERT INTO "Waiting List" VALUES(1, 1);
INSERT INTO "Waiting List" VALUES(2, 2);
INSERT INTO "Waiting List" VALUES(3, 3);
INSERT INTO "Waiting List" VALUES(4, 4);
INSERT INTO "Waiting List" VALUES(5, 5);
INSERT INTO "Waiting List" VALUES(6, 6);
INSERT INTO "Waiting List" VALUES(7, 7);
INSERT INTO "Waiting List" VALUES(8, 8); 
INSERT INTO "Waiting List" VALUES(9, 9);
INSERT INTO "Waiting List" VALUES(10, 10);


INSERT INTO "Patient_Waiting List" VALUES(1, 1);
INSERT INTO "Patient_Waiting List" VALUES(2, 2);
INSERT INTO "Patient_Waiting List" VALUES(3, 3);
INSERT INTO "Patient_Waiting List" VALUES(4, 4);
INSERT INTO "Patient_Waiting List" VALUES(5, 5);
INSERT INTO "Patient_Waiting List" VALUES(6, 6);
INSERT INTO "Patient_Waiting List" VALUES(7, 7);
INSERT INTO "Patient_Waiting List" VALUES(8, 8);
INSERT INTO "Patient_Waiting List" VALUES(9, 9);
INSERT INTO "Patient_Waiting List" VALUES(10, 10);


INSERT INTO Appointment VALUES (1,1,'23-JAN-2023 07:20:00','23-JAN-2023 07:35:00');
INSERT INTO Appointment VALUES (2,2,'25-DEC-2022 03:10:00','25-DEC-2022 03:35:00');
INSERT INTO Appointment VALUES (3,3,'10-FEB-2023 04:20:00','10-FEB-2023 04:35:00');
INSERT INTO Appointment VALUES (4,4,'15-MAR-2023 06:20:00', '15-MAR-2023 06:30:00');
INSERT INTO Appointment VALUES (5,5,'12-JUL-2023 01:00:00','12-JUL-2023 01:20:00');
INSERT INTO Appointment VALUES (6,6,'30-AUG-2023 04:15:00','30-AUG-2023 04:30:00');
INSERT INTO Appointment VALUES (7,7,'10-SEP-2023 04:10:00','10-SEP-2023 04:30:00');
INSERT INTO Appointment VALUES (8,8,'23-JAN-2023 02:00:00','23-JAN-2023 02:25:00');
INSERT INTO Appointment VALUES (9,9,'15-NOV-2023 08:10:00','15-NOV-2023 08:25:00');
INSERT INTO Appointment VALUES (10,10,'17-DEC-2023 03:20:00','17-DEC-2023 03:35:00');


INSERT INTO Operations VALUES (1, 'Heart Operation', 1, 1, 1);
INSERT INTO Operations VALUES (2, 'Leg Operation', 2, 2, 2);
INSERT INTO Operations VALUES (3, 'Hip Operation', 3, 3, 3);
INSERT INTO Operations VALUES (4, 'Heart Operation', 4, 4, 4);
INSERT INTO Operations VALUES (5, 'Brain Operation', 5, 5, 5); 
INSERT INTO Operations VALUES (6, 'Lung Operation', 6, 6, 6);
INSERT INTO Operations VALUES (7, 'Arm Operation', 7, 7, 7);
INSERT INTO Operations VALUES (8, 'Feet Operation', 8, 8, 8);
INSERT INTO Operations VALUES (9, 'Kidney Operation', 9, 9, 9);
INSERT INTO Operations VALUES (10, 'Liver Operation', 10, 10, 10);


-- Basic Query
SELECT Name, "Population No" FROM Countries
WHERE "Population No" > 1000000;

SELECT Counties.Name, Districts.Name
FROM Counties, Districts
WHERE Counties.id = Districts.id;


-- Medium Queries
SELECT D.name, count(P.id) FROM patient P
INNER JOIN districts D ON P.districtsid = D.id
GROUP BY D.id, D.name;


SELECT O."Operation Type", AVG("Population No") FROM Operations O
INNER JOIN Countries C on O.id = C.id
GROUP BY O."Operation Type"
ORDER BY O."Operation Type";



SELECT Co.name, avg(C."Population No") FROM Counties C
INNER JOIN Countries Co ON C.countriesID = Co.id
GROUP BY Co."Population No", Co.name
ORDER BY Co."Population No" ASC;


-- Medium Queries
SELECT D.name, count(P.id) FROM patient P
INNER JOIN districts D ON P.districtsid = D.id
GROUP BY D.id, D.name;


SELECT O."Operation Type", AVG("Population No") FROM Operations O
INNER JOIN Countries C on O.id = C.id
GROUP BY O."Operation Type"
ORDER BY O."Operation Type";


SELECT Co.name, avg(C."Population No") FROM Counties C
INNER JOIN Countries Co ON C.countriesID = Co.id
GROUP BY Co."Population No", Co.name
ORDER BY Co."Population No" ASC;


-- Hard Queries
SELECT Name,"Population No" from Districts
WHERE "Population No" > (
  select AVG("Population No")
  FROM Districts
);


SELECT id,AVG("Population No") 
FROM Counties  
GROUP BY id  
HAVING AVG("Population No")<           
(SELECT Max(AVG("Population No"))           
FROM Districts           
WHERE id IN                 
(SELECT id FROM Patient                
WHERE id                 
BETWEEN 1 AND 4)             
GROUP BY id);


SELECT Forename, Surname, Name, "Date of Birth"
FROM Patient INNER JOIN Counties
ON Patient.Countiesid = Counties.id
WHERE "Population No" >= (SELECT AVG("Population No")FROM Counties) AND "Employment Status" LIKE 'E%'
OR Postcode LIKE 'N%'
ORDER BY "Date of Birth" ASC;



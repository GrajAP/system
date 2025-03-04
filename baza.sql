-- Warning: You can generate script only for one table/view at a time in your Free plan 
-- 
-- **************************** SqlDBM: MySQL ***************************
-- **** Generated by SqlDBM: system by wedrychowiczbartek11@gmail.com ***



-- ************************************** `uzytkownicy`

CREATE TABLE `uzytkownicy`
(
 `idElektronika` int NOT NULL AUTO_INCREMENT ,
 `nazwa`         varchar(45) NOT NULL ,
 `haslo`         varchar(45) NOT NULL ,
 `uprawnienia`   enum('admin','elektronik') NOT NULL ,
 `czyPracuje`    boolean NOT NULL ,

PRIMARY KEY (`idElektronika`)
);

CREATE TABLE `statusZlecenia`
(
 `idStatus` int NOT NULL ,
 `nazwa`    varchar(45) NOT NULL ,

PRIMARY KEY (`idStatus`)
);

INSERT INTO `statuszlecenia` (`idStatus`, `nazwa`) VALUES (1, 'Przyjęto'),(2,"Diagnoza"),(3,"Zgoda"),
(4,"Testy"),(5,"Wycenione"),(6,"Brak Zgody"),(7,"Brak Wyceny"),(8,"Naprawione"),(9,"Brak możliwości naprawy"),
(10,"Złom/zwrot"),(11,"Oczekuje na kuriera"),(12,"Wysłane"),(13,"Zakończone");


CREATE TABLE `gwarancje`
(
 `idGwarancji` int NOT NULL AUTO_INCREMENT ,
 `nazwa`       varchar(45) NOT NULL ,

PRIMARY KEY (`idGwarancji`)
);

INSERT INTO `gwarancje` (`idGwarancji`, `nazwa`) VALUES (1, 'Nowe urządzenie'),(2,'Gwarancja'),(3,'Po gwarancji');

CREATE TABLE `zlecenia`
(
 `NumerZlecenia` int NOT NULL AUTO_INCREMENT ,
 `NazwaFirma`    varchar(255) NOT NULL ,
 `Osoba`         varchar(45) NOT NULL ,
 `NumerTelefonu` int NOT NULL ,
 `Urzadzenie`    varchar(255) NOT NULL ,
 `DataPrzyjecia` date NOT NULL ,
 `DataWydania`   date NOT NULL ,
 `idGwarancji`   int NOT NULL ,
 `idElektronika` int NOT NULL ,
 `idStatus`      int NOT NULL ,
 `Uwagi`         text NOT NULL ,
 `DataZgody`     date NOT NULL ,
 `NumerFaktury`  varchar(45) NOT NULL ,
 `Kurier`        varchar(45) NOT NULL ,
 `NrListu`       varchar(45) NOT NULL ,
 `KosztCz`       int NOT NULL ,

PRIMARY KEY (`NumerZlecenia`),
CONSTRAINT `FK_1` FOREIGN KEY (`idElektronika`) REFERENCES `uzytkownicy` (`idElektronika`),
CONSTRAINT `FK_2` FOREIGN KEY (`idStatus`) REFERENCES `statusZlecenia` (`idStatus`),
CONSTRAINT `FK_3` FOREIGN KEY (`idGwarancji`) REFERENCES `gwarancje` (`idGwarancji`)
);



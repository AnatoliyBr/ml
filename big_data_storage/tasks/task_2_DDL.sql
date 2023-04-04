CREATE TABLE Car (
    Regist CHAR(10) PRIMARY KEY,
    CurN CHAR(6) NOT NULL,
    Region INTEGER NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    Power INTEGER NOT NULL CHECK(Power>50),
    CarYear INTEGER NOT NULL,
    Mileage INTEGER,
    UNIQUE (CurN,Region)
);

INSERT INTO Car VALUES('8779854025', 'B971HP', 199, 'Lada Granta','Красный', 87, 2017, 35);
INSERT INTO Car VALUES('6239572784', 'H109OK', 178, 'Volkswagen Polo','Синий', 105, 2018, 40);
INSERT INTO Car VALUES('7984672834', 'T120AA', 98, 'Hyundai Solaris','Черный', 123, 2019, 20);
INSERT INTO Car VALUES('4728472878', 'T120AA', 77, 'Toyota RAV4','Серебристо-серый', 146, 2008);
INSERT INTO Car VALUES('4782487387', 'H454EE', 98, 'Skoda Rapid','Черный', 75, 2021, 0);
INSERT INTO Car VALUES('9884274842', 'O638OA', 173, 'Mitsubishi Outlander','Белый', 230, 2021);
INSERT INTO Car VALUES('7284728297', 'M118EA', 66, 'Hyundai Solaris','Синий', 123, 2021, 0);

SELECT * FROM Car

CREATE TABLE Diploma(
    Student_Id INTEGER,
    Name_of_Subject VARCHAR(25) NOT NULL,
    Total_Hours INTEGER CHECK(Total_Hours>30),
    Grade Integer CHECK(Grade IN(3, 4, 5)),
    Teacher_Name VARCHAR(50),
    PRIMARY KEY(Student_Id,Name_of_Subject)
);

INSERT INTO Diploma VALUES(55, 'Algebra', 32, 5,'Petrov V.');
INSERT INTO Diploma VALUES(44, 'DataBases', 96, 4,'Chukilova');
INSERT INTO Diploma VALUES(55, 'Microeconomics', 108, 5,'Ivanova O.');
INSERT INTO Diploma (Student_Id, Name_of_Subject, Grade, Total_Hours) VALUES(33, 'Microeconomics', 5, 96);


SELECT * FROM Diploma
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    FoundedYear INT CHECK (FoundedYear >= 1900),
    HeadquartersLocation VARCHAR(100),
    UNIQUE (AirlineName)
);

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(10) NOT NULL,
    DepartureAirport VARCHAR(50),
    ArrivalAirport VARCHAR(50),
    DepartureTime DATE,
    ArrivalTime DATE,
    AirlineID INT,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

INSERT INTO Airlines (AirlineID, AirlineName, Country, FoundedYear, HeadquartersLocation)
VALUES
    (1, 'S7', 'Russia', 1975, 'Moscow, Russia'),
    (2, 'Emirates', 'Arab Emirates', 1985, 'Dubai, Paris'),
    (3, 'Ilysha Airlines', 'USA', 2000, 'Kazan, Russia');


INSERT INTO Flights (FlightID, FlightNumber, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime, AirlineID)
VALUES
    (101, 'LH123', 'FRA', 'JFK', '2023-10-25 14:00:00', '2023-10-25 18:30:00', 1),
    (102, 'EK202', 'DXB', 'JFK', '2023-10-26 08:30:00', '2023-10-26 13:00:00', 2),
    (103, 'DL456', 'ATL', 'LAX', '2023-10-27 09:15:00', '2023-10-27 12:45:00', 3);


INSERT INTO Passengers (PassengerID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address)
VALUES
    (1001, 'Ayaz', 'Minegal', '2005-05-15', 'M', 'Ayaz@email.com', '+77777777777', 'Durtuli'),
    (1002, 'Kirill', 'Efrem', '2005-12-03', 'M', 'Kirya@email.com', '+78888888888', 'Alikovo'),
    (1003, 'Ilya', 'Mikhailov', '2004-08-20', 'M', 'Ilya@email.com', '+79999999999', 'Shemursha');


CREATE TABLE Aircrafts (
    aircraftid INT PRIMARY KEY,
    aircraftnumber varchar(50) NOT NULL,
    capacity INT NOT NULL,
    mfdcompany varchar(50) NOT NULL,
    datemanufactured Datetime NOT NULL
);

CREATE TABLE Routepath (
    Routeid INT PRIMARY KEY,
    AirportName varchar(35) NOT NULL,
    Destination varchar(40) NOT NULL,
    RouteCode varchar(40) NOT NULL UNIQUE,
    aircraftid INT,
    CONSTRAINT aircraftid FOREIGN KEY(aircraftid) REFERENCES Aircrafts (aircraftid)
);

CREATE TABLE Airfare(
    AirfareId INT PRIMARY KEY,
    FareInNaira decimal,
    RouteId INT,
    CONSTRAINT RouteId FOREIGN KEY(RouteId) REFERENCES Routepath (RouteId)
);

CREATE TABLE Countries(
    CountryId INT PRIMARY KEY,
    CountryName varchar(50) ,
    CountryCode varchar(5)
);

CREATE TABLE Branches(
    BranchId INT PRIMARY KEY,
    Center varchar(30) NOT NULL,
    BranchAddress varchar(30) NOT NULL,
    StateBranch varchar(30),
    CountryId INT,
    CONSTRAINT CountryId FOREIGN KEY(CountryId) REFERENCES Countries (CountryId)
);

CREATE TABLE States(
    StateId INT PRIMARY KEY,
    StateName varchar(20),
    CountryId INT,
    CONSTRAINT CountryId FOREIGN KEY (CountryId) REFERENCES Countries (CountryId)
);

CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY,
    EmployeeName varchar(30) NOT NULL,
    EmployeeAddress varchar(100),
    EmployeeBranch INT,
    CONSTRAINT EmployeeBranch FOREIGN KEY(EmployeeBranch) REFERENCES Branches (BranchId),
    EmployeeDesignation varchar NOT NULL,
    Email varchar(40) NOT NULL,
    Telephone varchar(30)
);

CREATE TABLE Flight_Schedule(
    Flightsceduleid INT PRIMARY KEY,
    Flyingpath varchar(50), NOT NULL,
    FlightScheduleDate DATETIME NOT NULL,
    Flying_From varchar(20),
    Flying_to varchar(20),
    Adult INT, 
    Child INT,
    INFANT INT,
    CONSTRAINT fs_aircraft FOREIGN KEY(Aircrafts) REFERENCES Aircrafts(aircraftid),
    CONSTRAINT fs_netfare FOREIGN KEY(NetFare) REFERENCES (AirfareId)
);

CREATE TABLE Financial_Transaction(
    TransactionId INT PRIMARY KEY,
    BookingDate DATETIME NOT NULL,
    DepartureDay DATETIME NOT NULL,
    PassengersId INT FOREIGN KEY,
    Flightsceduleid INT FOREIGN KEY
    EmployeeId INT FOREIGN KEY 
    CashTransaction decimal,
    CreditCardTransaction decimal      
);

CREATE TABLE Discounts(
    DiscountId INT PRIMARY KEY,
    Title varchar(50) NOT NULL,
    Amount INT NOT NULL,
    DiscountDescription varchar(400)
);

CREATE TABLE Contact_Details(
    Contact_Id INT PRIMARY KEY,
    Email varchar(30) NOT NULL,
    PhoneCell varchar(20) NOT NULL,
    HomeCell varchar(20),
    StreetAddress varchar(100) NOT NULL,
);

CREATE TABLE Passengers(
    PassengersId INT PRIMARY KEY,
    PassengersName varchar(50) NOT NULL,
    PassengersAddress varchar(100) NOT NULL,
    PassengersAge INT NOT NULL,
    Nationalities varchar(20) NOT NULL,
    PassengersContactId INT,
    CONSTRAINT PassengersContactId FOREIGN KEY (PassengersContactId) REFERENCES Contact_Details (Contact_Id)
);

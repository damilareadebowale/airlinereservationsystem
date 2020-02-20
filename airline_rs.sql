
CREATE TABLE Aircrafts (
    aircraftid INT,
    aircraftnumber varchar(50) NOT NULL,
    capacity INT NOT NULL,
    mfdcompany varchar(50) NOT NULL,
    datemanufactured Datetime NOT NULL
    PRIMARY KEY (aircraftid)
);

CREATE TABLE Routepath (
    Routeid INT,
    AirportName varchar(35) NOT NULL,
    Destination varchar(40) NOT NULL,
    RouteCode varchar(40) NOT NULL UNIQUE,
    Routepathid INT,
    PRIMARY KEY (Routeid),
    FOREIGN KEY(Routepathid) REFERENCES Aircrafts (aircraftid)
);

CREATE TABLE Airfare(
    AirfareId INT,
    FareInNaira decimal,
    RouteId INT,
    AirfareRouteId INT,
    PRIMARY KEY (AirfareId),
    FOREIGN KEY(AirfareRouteId) REFERENCES Routepath (RouteId)
);

CREATE TABLE Countries(
    CountryId INT,
    CountryName varchar(50) ,
    CountryCode varchar(5),
    PRIMARY KEY (CountryId)
);

CREATE TABLE Branches(
    BranchId INT PRIMARY KEY,
    Center varchar(30) NOT NULL,
    BranchAddress varchar(30) NOT NULL,
    StateBranch varchar(30),
    CountryId INT,
    BranchInCountryId INT,
    PRIMARY KEY (BranchId),
    FOREIGN KEY(BranchInCountryId) REFERENCES Countries (CountryId)
);

CREATE TABLE States(
    StateId INT,
    StateName varchar(20),
    CountryId INT,
    PRIMARY KEY (StateId),
    FOREIGN KEY (CountryId) REFERENCES Countries (CountryId)
);

CREATE TABLE Employee (
    EmployeeId INT,
    EmployeeName varchar(30) NOT NULL,
    EmployeeAddress varchar(100),
    EmployeeBranch INT,
    EmployeeDesignation varchar(20) NOT NULL,
    Email varchar(40) NOT NULL,
    Telephone varchar(30)
    PRIMARY KEY (EmployeeId),
    FOREIGN KEY(EmployeeBranch) REFERENCES Branches (BranchId)
);

CREATE TABLE Flight_Schedule(
    FlightScheduleId INT,
    Flyingpath varchar(50) NOT NULL,
    FlightScheduleDate DATETIME NOT NULL,
    Flying_From varchar(20),
    Flying_to varchar(20),
    Adult INT, 
    Child INT,
    INFANT INT,
    fs_aircraftid INT,
    fs_netfare decimal,
    PRIMARY KEY (FlightScheduleId),
    FOREIGN KEY (fs_aircrafts) REFERENCES Aircrafts (aircraftid),
    FOREIGN KEY (fs_netfare) REFERENCES Airfare (FareInNaira)
);

CREATE TABLE Contact_Details(
    Contact_Id INT,
    Email varchar(30) NOT NULL,
    PhoneCell varchar(20) NOT NULL,
    HomeCell varchar(20),
    StreetAddress varchar(100) NOT NULL,
    PRIMARY KEY (Contact_Id)
);


CREATE TABLE Passengers(
    PassengersId INT,
    PassengersName varchar(50) NOT NULL,
    PassengersAddress varchar(100) NOT NULL,
    PassengersAge INT NOT NULL,
    Nationalities varchar(20) NOT NULL,
    PassengersContactId INT,
    PRIMARY KEY (PassengersId),
    FOREIGN KEY (PassengersContactId) REFERENCES Contact_Details (Contact_Id)
);


CREATE TABLE Financial_Transaction(
    TransactionId INT,
    BookingDate DATETIME NOT NULL,
    DepartureDay DATETIME NOT NULL,
    PassengersId INT,
    FlightScheduleId INT,
    EmployeeId INT, 
    CashTransaction decimal,
    CreditCardTransaction decimal,
    PRIMARY KEY (TransactionId),
    FOREIGN KEY (PassengersId) REFERENCES Passengers (PassengersId),
    FOREIGN KEY (FlightScheduleId) REFERENCES Flight_Schedule (FlightScheduleId)
);

CREATE TABLE Discounts(
    DiscountId INT,
    Title varchar(50) NOT NULL,
    Amount decimal NOT NULL,
    TransactionId INT,
    Contact_Id INT,
    DiscountDescription varchar(400),
    FOREIGN KEY (TransactionId) REFERENCES Financial_Transaction (TransactionId),
    FOREIGN KEY (Contact_Id) REFERENCES Contact_Details (Contact_Id)
);

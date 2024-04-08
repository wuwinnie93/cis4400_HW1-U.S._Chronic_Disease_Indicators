-- Create LocationDimension Table
CREATE TABLE LocationDimension (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationAbbr VARCHAR(10),
    LocationDesc VARCHAR(100),
    Geolocation VARCHAR(255)
);

-- Create TimeDimension Table
CREATE TABLE TimeDimension (
    TimeID INT IDENTITY(1,1) PRIMARY KEY,
    YearStart INT,
    YearEnd INT,
    Quarter INT,
    Month INT
);

-- Create TopicDimension Table
CREATE TABLE TopicDimension (
    TopicID INT IDENTITY(1,1) PRIMARY KEY,
    Topic VARCHAR(50),
    Question VARCHAR(255),
    DataValueType VARCHAR(50)
);

-- Create DiseaseIndicatorsFact Table
CREATE TABLE DiseaseIndicatorsFact (
    IndicatorID INT IDENTITY(1,1) PRIMARY KEY,
    LocationID INT,
    TimeID INT,
    TopicID INT,
    DataValue FLOAT,
    LowConfidenceLimit FLOAT,
    HighConfidenceLimit FLOAT,
    FOREIGN KEY (LocationID) REFERENCES LocationDimension(LocationID),
    FOREIGN KEY (TimeID) REFERENCES TimeDimension(TimeID),
    FOREIGN KEY (TopicID) REFERENCES TopicDimension(TopicID)
);



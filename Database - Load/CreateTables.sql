CREATE TABLE City (
	 cityID INT PRIMARY KEY,
	 cityName varChar(100),
	 cityPopulation INT
 
);


CREATE TABLE Austin (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);

CREATE TABLE SanFran (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
);

CREATE TABLE LA (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);

CREATE TABLE Boston (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);

CREATE TABLE Chandler (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);

CREATE TABLE Pittsburgh (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);

CREATE TABLE Houston (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);

CREATE TABLE Spokane (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);

CREATE TABLE Chicago (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);


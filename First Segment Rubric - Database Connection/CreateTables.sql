CREATE TABLE City (
	 cityID INT PRIMARY KEY,
	 cityName varChar(100),
	 cityPopulation INT
 
);


CREATE TABLE Austin (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 neighborhood VARCHAR(100),
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);

CREATE TABLE SanFran (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 neighborhood VARCHAR(100),
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
);

CREATE TABLE LA (
     price INT ,
     bedroom INT ,
	 sqft FLOAT ,
	 neighborhood VARCHAR(100),
	 bathroom FLOAT,
	 amenity_count INT, 
	 cityID INT,
	 FOREIGN KEY (cityID) REFERENCES City (cityID)
	
);
SELECT sanfran.price, sanfran.sqft, sanfran.neighborhood,la.sqft,la.neighborhood
FROM sanfran
INNER JOIN la
ON sanfran.price = la.price;
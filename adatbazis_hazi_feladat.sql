CREATE TABLE ugyfel_mask (
    LOGIN NVARCHAR(50) PRIMARY KEY,
    EMAIL NVARCHAR(100) MASKED WITH (FUNCTION = 'email()'),
    NEV NVARCHAR(100) MASKED WITH (FUNCTION = 'partial(1, "XXXXXX", 1)'),
    SZULEV INT MASKED WITH (FUNCTION = 'random(1,10)'),
    NEM NVARCHAR(1)
);

INSERT INTO ugyfel_mask (LOGIN, EMAIL, NEV, SZULEV, NEM) VALUES
('adam1', 'adam.kiss@mail.hu', 'Kiss Ádám', 1991, 'F'),
('adam3', 'adam3@gmail.com', 'Barkóci Ádám', 1970, 'F'),
('adam4', 'adam.bieniek@mail.hu', 'Bieniek Ádám', 1976, 'F'),
('agnes', 'agnes@gmail.com', 'Lengyel Ágnes', 1979, 'N'),
('agnes3', 'agnes3@gmail.com', 'Hartyánszky Ágnes', 1967, 'N');

CREATE USER felhasznalo WITHOUT LOGIN;
GRANT SELECT ON ugyfel_mask TO felhasznalo;
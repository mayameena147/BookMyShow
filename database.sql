-----------------------Create Tables-----------------------------
CREATE TABLE Theaters (
    TheaterId INT PRIMARY KEY,
    TheaterName VARCHAR(50) NOT NULL
);

CREATE TABLE Movies (
	MovieId INT PRIMARY KEY,
	MovieName VARCHAR(100) NOT NULL
);

CREATE TABLE Shows (
    ShowId INT PRIMARY KEY,
    TheaterId INT NOT NULL,
    MovieId INT NOT NULL,
    Date DATE NOT NULL,
    Timing TIME NOT NULL,
    FOREIGN KEY (TheaterId) REFERENCES Theaters(TheaterId),
    FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
    UNIQUE (TheaterId, MovieId, Date, Timing)
);

CREATE TABLE Bookings (
    BookingId INT PRIMARY KEY,
    ShowId INT,
    CustomerName VARCHAR(100) NOT NULL
    FOREIGN KEY (ShowId) REFERENCES Shows(ShowId)
);

-----------------------Insert data-----------------------------

INSERT INTO Theaters (TheaterId, TheaterName) VALUES 
(1, 'Cineplex'),
(2, 'PVR'),
(3, 'INOX');

INSERT INTO Movies (MovieId, MovieName) VALUES 
(1, 'Stree2'),
(2, 'Joker');

INSERT INTO Shows (ShowId, TheaterId, MovieId, Date, Timing) VALUES 
(1, 1, 1, '2024-09-25', '14:00:00'),
(2, 1, 2, '2024-09-25', '16:30:00'),
(3, 2, 1, '2024-09-25', '18:00:00');

INSERT INTO Bookings (BookingId, ShowId, CustomerName) VALUES 
(1, 1, 'User1'),
(2, 2, 'User2');

-----------------------Get List of All Shows for given Date and Theater-----------------------------

SELECT m.MovieName, s.Timing
FROM Shows s
JOIN Movies m 
	ON s.MovieId = m.MovieId
WHERE 
    s.Date = '2024-09-25' AND s.TheaterId = 1; 

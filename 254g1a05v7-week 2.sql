CREATE TABLE Sailors (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(30),
    rating NUMBER,
    age NUMBER(4,1)
);

CREATE TABLE Boats (
    bid NUMBER PRIMARY KEY,
    bname VARCHAR2(30),
    color VARCHAR2(20)
);

CREATE TABLE Reserves (
    sid NUMBER,
    bid NUMBER,
    day DATE,
    PRIMARY KEY (sid, bid, day),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);


-- SAILORS

INSERT ALL
    INTO Sailors VALUES (22, 'Dustin', 7, 45.0)
    INTO Sailors VALUES (29, 'Brutus', 1, 33.0)
    INTO Sailors VALUES (31, 'Lubber', 8, 55.5)
    INTO Sailors VALUES (32, 'Andy', 8, 25.5)
    INTO Sailors VALUES (58, 'Rusty', 10, 35.0)
    INTO Sailors VALUES (64, 'Horatio', 7, 35.0)
    INTO Sailors VALUES (71, 'Zorba', 10, 16.0)
    INTO Sailors VALUES (74, 'Horatio', 9, 35.0)
    INTO Sailors VALUES (85, 'Art', 3, 25.5)
    INTO Sailors VALUES (95, 'Bob', 3, 63.5)
SELECT * FROM dual;


-- BOATS

INSERT ALL
    INTO Boats VALUES (101, 'Interlake', 'blue')
    INTO Boats VALUES (102, 'Interlake', 'red')
    INTO Boats VALUES (103, 'Clipper', 'green')
    INTO Boats VALUES (104, 'Marine', 'red')
SELECT * FROM dual;


-- RESERVES

INSERT ALL
    INTO Reserves VALUES (22, 101, DATE '1998-10-10')
    INTO Reserves VALUES (22, 102, DATE '1998-10-10')
    INTO Reserves VALUES (22, 103, DATE '1998-10-08')
    INTO Reserves VALUES (22, 104, DATE '1998-10-07')
    INTO Reserves VALUES (31, 102, DATE '1998-11-10')
    INTO Reserves VALUES (31, 103, DATE '1998-11-06')
    INTO Reserves VALUES (31, 104, DATE '1998-11-12')
    INTO Reserves VALUES (64, 101, DATE '1998-09-05')
    INTO Reserves VALUES (64, 102, DATE '1998-09-08')
    INTO Reserves VALUES (74, 103, DATE '1998-09-08')
SELECT * FROM dual;

COMMIT;


-- 1
SELECT sname, age
FROM Sailors;


-- 2
SELECT *
FROM Sailors
WHERE rating > 7;


-- 3
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;


-- 4
SELECT DISTINCT r.sid
FROM Reserves r, Boats b
WHERE r.bid = b.bid
AND b.color = 'red';


-- 5
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';


-- 6
SELECT DISTINCT b.color
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND s.sname = 'Lubber';


-- 7
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid;


-- 8
SELECT DISTINCT s.sid, s.sname, s.rating,
       s.rating + 1 AS new_rating
FROM Sailors s, Reserves r1, Reserves r2
WHERE s.sid = r1.sid
AND r1.sid = r2.sid
AND r1.day = r2.day
AND r1.bid <> r2.bid;


-- 9
SELECT age
FROM Sailors
WHERE sname LIKE 'B%B'
AND LENGTH(sname) >= 3;


-- 10
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color IN ('red', 'green');


-- 11
SELECT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color IN ('red', 'green')
GROUP BY s.sid, s.sname
HAVING COUNT(DISTINCT b.color) = 2;


-- 12
SELECT DISTINCT r.sid
FROM Reserves r, Boats b
WHERE r.bid = b.bid
AND b.color = 'red'
AND r.sid NOT IN (
    SELECT r2.sid
    FROM Reserves r2, Boats b2
    WHERE r2.bid = b2.bid
    AND b2.color = 'green'
);


-- 13
SELECT sid
FROM Sailors
WHERE rating = 10
UNION
SELECT sid
FROM Reserves
WHERE bid = 104;


-- 14
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;


-- 15
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';


-- 16
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;


-- 17
SELECT *
FROM Sailors
WHERE rating > ANY (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);


-- 18
SELECT *
FROM Sailors
WHERE rating > ALL (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);


-- 19
SELECT *
FROM Sailors
WHERE rating = (
    SELECT MAX(rating)
    FROM Sailors
);


-- 20
SELECT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color IN ('red', 'green')
GROUP BY s.sid, s.sname
HAVING COUNT(DISTINCT b.color) = 2;


-- 21
SELECT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
GROUP BY s.sid, s.sname
HAVING COUNT(DISTINCT r.bid) = (
    SELECT COUNT(*)
    FROM Boats
);


-- 22
SELECT AVG(age) AS average_age
FROM Sailors;


-- 23
SELECT AVG(age) AS average_age
FROM Sailors
WHERE rating = 10;


-- 24
SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MAX(age)
    FROM Sailors
);


-- 25
SELECT COUNT(*) AS total_sailors
FROM Sailors;


-- 26
SELECT COUNT(DISTINCT sname) AS different_names
FROM Sailors;


-- 27
SELECT sname, age
FROM Sailors
WHERE age > (
    SELECT MAX(age)
    FROM Sailors
    WHERE rating = 10
);


-- 28
SELECT rating, MIN(age) AS youngest_age
FROM Sailors
GROUP BY rating
ORDER BY rating;


-- 29
SELECT rating, MIN(age) AS youngest_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2
ORDER BY rating;


-- 30
SELECT b.bid, COUNT(r.sid) AS reservations
FROM Boats b
LEFT JOIN Reserves r
ON b.bid = r.bid
WHERE b.color = 'red'
GROUP BY b.bid
ORDER BY b.bid;


-- 31
SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2
ORDER BY rating;


-- 32
SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING rating IN (
    SELECT rating
    FROM Sailors
    GROUP BY rating
    HAVING COUNT(*) >= 2
)
ORDER BY rating;


-- 33
SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2
ORDER BY rating;


-- 34
SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating
HAVING AVG(age) = (
    SELECT MIN(avg_age)
    FROM (
        SELECT AVG(age) AS avg_age
        FROM Sailors
        GROUP BY rating
    )
);

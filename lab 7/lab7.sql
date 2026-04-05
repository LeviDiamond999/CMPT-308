DROP TABLE IF EXISTS Accounts;

CREATE TABLE Accounts (
  account_id INT PRIMARY KEY,
  owner TEXT NOT NULL,
  balance INT NOT NULL CHECK (balance >= 0)
);

INSERT INTO Accounts (account_id, owner, balance) VALUES
(1, 'Ava', 500),
(2, 'Ben', 300),
(3, 'Cara', 200);

SELECT * 
FROM Accounts
WHERE account_id = 1
UNION
SELECT * 
FROM Accounts
WHERE account_id = 2;

BEGIN;

UPDATE Accounts
SET balance = balance - 100
WHERE account_id = 1 and balance >= 100;

UPDATE Accounts
SET balance = balance + 100
WHERE account_id = 2;

COMMIT;

SELECT * 
FROM Accounts
WHERE account_id = 1
UNION
SELECT * 
FROM Accounts
WHERE account_id = 2;

--resetting the balances to the original values
BEGIN;

UPDATE Accounts
SET balance = balance + 100
WHERE account_id = 1;

UPDATE Accounts
SET balance = balance - 100
WHERE account_id = 2;

COMMIT;

SELECT * 
FROM Accounts
WHERE account_id = 1
UNION
SELECT * 
FROM Accounts
WHERE account_id = 2;


BEGIN;

UPDATE Accounts
SET balance = balance - 99
WHERE account_id = 1 and balance >= 100;

UPDATE Accounts
SET balance = balance + 100000
WHERE account_id = 2;

ROLLBACK;

SELECT * 
FROM Accounts
WHERE account_id = 1
UNION
SELECT * 
FROM Accounts
WHERE account_id = 2;



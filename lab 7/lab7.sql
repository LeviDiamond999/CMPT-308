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


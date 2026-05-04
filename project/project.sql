CREATE TABLE QBgames(
game_id VARCHAR(20),
home_team VARCHAR(4),
away_team VARCHAR(4),
posteam VARCHAR(4),
defteam VARCHAR(4),
PRIMARY KEY (game_id, posteam)
);

CREATE TABLE Quarterbacks(
passer_id INT PRIMARY KEY,
player VARCHAR(100),
team VARCHAR(4),
salary INT
);

CREATE TABLE QBplays(
play_id INT,
game_id VARCHAR (20),
passer_id INT,
posteam VARCHAR(4),
pass_attempt INT,
pass_touchdown INT,
complete_pass INT,
qb_epa DECIMAL,
shotgun INT,
qb_dropback INT,
qb_scramble INT,
yards_gained INT,
PRIMARY KEY (play_id, game_id, passer_id),
FOREIGN KEY (game_id, posteam) REFERENCES QBgames(game_id, posteam),
FOREIGN KEY (passer_id) REFERENCES Quarterbacks(passer_id)
);


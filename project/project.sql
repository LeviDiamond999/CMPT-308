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
passing_yards INT, 
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


-- import the csvs from R to SQL
\copy QBplays FROM '/Users/levidiamond/Desktop/Cmpt 308/project/QBplays.csv' CSV HEADER NULL 'NA';

-- creating summation tables
CREATE TABLE Game_Stats AS
SELECT game_id, passer_id, 
  SUM(passing_yards) AS game_pYards, 
  SUM(pass_attempt) AS game_p_ATT, 
  SUM(pass_touchdown) AS game_p_TD, 
  SUM(complete_pass) AS game_p_Comp, 
  SUM(qb_epa) AS game_qb_epa, 
  SUM(shotgun) AS game_shotgun, 
  SUM(qb_dropback) AS game_qbdropbacks, 
  SUM(qb_scramble) AS game_qb_scrambles, 
  SUM(yards_gained) AS game_total_yards
FROM QBplays
GROUP BY game_id, passer_id;

CREATE TABLE Season_Stats AS 
SELECT passer_id,
  SUM(passing_yards) AS p_Yards, 
  SUM(pass_attempt) AS p_ATT, 
  SUM(pass_touchdown) AS p_TD, 
  SUM(complete_pass) AS p_Comp, 
  SUM(qb_epa) AS qb_epa, 
  SUM(shotgun) AS shotgun, 
  SUM(qb_dropback) AS qbdropbacks, 
  SUM(qb_scramble) AS qb_scrambles, 
  SUM(yards_gained) AS total_yards
FROM QBplays
GROUP BY passer_id;

-- creating a procedure that adds plays to the play-by-play data table
-- has to check if the QB or game is real
-- has to check if that play already happened

CREATE PROCEDURE add_play(p_play_id INT, p_game_id INT , p_passer_id INT, p_posteam INT, 
  p_passing_yards INT, p_pass_attempt INT, p_pass_touchdown INT, p_complete_pass INT, 
  p_qb_epa INT, p_shotgun INT, p_qb_dropback INT, p_qb_scramble INT , p_yards_gained INT)
LANGUAGE plpgsql AS $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM Quarterbacks WHERE passer_id = p_passer_id) THEN
    RAISE EXCEPTION 'That Quarterback does not exist', p_passer_id;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM QBgames WHERE game_id = p_game_id) THEN
    RAISE EXCEPTION 'That game has not happened', p_game_id;
  END IF;

  IF EXISTS (
    SELECT 1 FROM QBplays 
    WHERE play_id = p_play_id AND game_id = p_game_id
    ) THEN
       RAISE EXCEPTION 'This play already happened.', p_play_id, p_game_id;
    END IF;

  INSERT INTO QBplays(play_id, game_id, passer_id, posteam, 
  passing_yards, pass_attempt, pass_touchdown, 
  complete_pass, qb_epa, shotgun, qb_dropback, qb_scramble, yards_gained);

  VALUES (
    p_play_id, p_game_id, p_passer_id, p_posteam,
    p_passing_yards, p_pass_attempt, p_pass_touchdown,
    p_complete_pass, p_qb_epa, p_shotgun,
    p_qb_dropback, p_qb_scramble, p_yards_gained
  );

END; $$;


--testing queries
SELECT play_id, game_id, posteam FROM QBplays
WHERE qb_scramble = 1 AND yards_gained > 39 

SELECT q.player, defteam, game_pYards, game_p_TD,  FROM Game_Stats g
JOIN Quarterbacks q 
ON g.passer_id = q.passer_id
JOIN QBgames b
ON b.game_id = g.game_id
WHERE game_p_TD > 3
ORDER BY game_pYards DESC

SELECT player, p.posteam, COUNT(p.play_id) AS Plays_over_10_yds FROM QBplays p
JOIN Quarterbacks q
ON p.passer_id = q.passer_id 
JOIN QBgames g
ON g.game_id = p.game_id
WHERE g.defteam = 'NYJ' 
  AND p.passing_yards > 10 
  AND p.posteam <> 'NYJ'
GROUP BY player, p.posteam, g.defteam
ORDER BY Plays_over_10_yds DESC

SELECT team, SUM(salary) AS QB_Payroll, SUM(total_yards) AS QB_total_yards FROM Quarterbacks q
JOIN Season_Stats s
ON s.passer_id = q.passer_id
GROUP BY team 

SELECT player, salary
FROM Quarterbacks
WHERE passer_id IN(
  SELECT passer_id
  FROM Season_Stats
  WHERE p_TD > 30)

SELECT play_id, defteam, passing_yards, pass_touchdown 
FROM QBplays p
JOIN Quarterbacks q
ON p.passer_id = q.passer_id
JOIN QBgames g
ON g.game_id = p.game_id
WHERE player = 'Mac Jones'
AND defteam <> 'SF'
ORDER BY game_id, play_id ASC



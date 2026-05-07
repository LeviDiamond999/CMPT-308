# 🏈 NFL QB Salary & Production Database

A relational database combining **2025 NFL play-by-play data** with **2026 quarterback salary data** — built to answer the questions that require multiple sources to answer manually.

> *Can a QB be elite and underpaid? Which defenses got torched the most? What does a team actually get for its QB payroll?*

---

## 📌 Overview

This project merges two datasets that don't naturally live together:

- **Play-by-play data** from the 2025 NFL season (sourced via [`nflfastR`](https://www.nflfastr.com/))
- **Quarterback salary data** from [Spotrac](https://www.spotrac.com/)

The result is a PostgreSQL database scoped to the **quarterback position** that lets you query production and compensation side by side — something that would otherwise require cross-referencing multiple websites.

---

## 🗄️ Schema

### Tables

| Table | Description |
|---|---|
| `QBgames` | Game-level metadata (home/away team, offense/defense) |
| `Quarterbacks` | QB name, team, and average annual salary |
| `QBplays` | Play-by-play data for every QB dropback in the 2025 season |
| `Game_Stats` | Per-game aggregated stats per QB (derived from `QBplays`) |
| `Season_Stats` | Full-season aggregated stats per QB (derived from `QBplays`) |

### Key Attributes (QBplays)
`play_id`, `game_id`, `passer_id`, `passing_yards`, `pass_attempt`, `pass_touchdown`, `complete_pass`, `qb_epa`, `shotgun`, `qb_dropback`, `qb_scramble`, `yards_gained`

---

## 🔍 Query Library

### 1. QB Scrambles of 40+ Yards
```sql
SELECT play_id, game_id, posteam FROM QBplays
WHERE qb_scramble = 1 AND yards_gained > 39
```
Finds plays where a QB tucked and ran for 40+ yards — useful for evaluating rushing upside.

---

### 2. Best Individual QB Games (4+ TDs)
```sql
SELECT q.player, game_id, game_pYards, game_p_TD FROM Game_Stats g
JOIN Quarterbacks q ON g.passer_id = q.passer_id
WHERE game_p_TD > 3
ORDER BY game_pYards DESC
```
A "ceiling" look — which QBs put up the most elite single-game performances?

---

### 3. Passing Efficiency vs. a Specific Defense
```sql
SELECT player, p.posteam, COUNT(p.play_id) AS Plays_over_10_yds FROM QBplays p
JOIN Quarterbacks q ON p.passer_id = q.passer_id
JOIN QBgames g ON g.game_id = p.game_id
WHERE g.defteam = 'NYJ' AND p.passing_yards > 10 AND p.posteam <> 'NYJ'
GROUP BY player, p.posteam, g.defteam
ORDER BY Plays_over_10_yds DESC
```
Useful for defensive game-planning — shows who consistently moved the ball against the Jets.

---

### 4. Team QB Payroll vs. Total Yards
```sql
SELECT team, SUM(salary) AS QB_Payroll, SUM(total_yards) AS QB_total_yards FROM Quarterbacks q
JOIN Season_Stats s ON s.passer_id = q.passer_id
GROUP BY team
```
Returns cost-per-yard efficiency by team — a front office favorite.

---

### 5. High-Performing, Underpaid QBs
```sql
SELECT player, salary FROM Quarterbacks
WHERE salary < 5000000 AND passer_id IN (
  SELECT passer_id FROM Season_Stats
  WHERE p_TD > 15 AND p_Yards > 3000
)
```
Finds QBs producing at a high level on rookie or bargain contracts. *Result: Bo Nix ($4.65M) and Geno Smith ($3.3M).*

---

### 6. Full Play Log for a Specific QB vs. Specific Opponents
```sql
SELECT play_id, defteam, passing_yards, pass_touchdown
FROM QBplays p
JOIN Quarterbacks q ON p.passer_id = q.passer_id
JOIN QBgames g ON g.game_id = p.game_id
WHERE player = 'Mac Jones' AND defteam <> 'SF' AND complete_pass = 1
ORDER BY p.game_id, play_id ASC
```
Every completed pass by a specific QB against every defense except one — scout film prep in SQL form.

---

## ⚙️ Setup

### Prerequisites
- PostgreSQL
- R with `nflfastR` installed (for data collection)

### Loading Data
```sql
-- After creating tables, import play-by-play CSV exported from R
\copy QBplays FROM '/path/to/QBplays.csv' CSV HEADER NULL 'NA';

-- Then build the aggregated tables
CREATE TABLE Game_Stats AS SELECT ...;
CREATE TABLE Season_Stats AS SELECT ...;
```

### Adding New Plays (Stored Procedure)
The `add_play()` procedure validates that the QB exists, the game exists, and the play hasn't already been recorded before inserting:
```sql
CALL add_play(play_id, game_id, passer_id, posteam, passing_yards, ...);
```

---

## 🛠️ Tech Stack

| Tool | Use |
|---|---|
| PostgreSQL | Database engine |
| R / nflfastR | Play-by-play data collection |
| Spotrac | Salary data source |

---

## 💡 Motivation

This project is a **blueprint** for combining any two athlete datasets that don't naturally live together — salary + production, combine results + career stats, medical history + on-field performance. The QB salary/production pairing is just one example of what becomes possible when related data is unified in a single queryable source.

---

## 👤 Author

**Levi Diamond**  
Data Science & Applied Mathematics @ Marist University  
[Instagram @sportsgraphsofficial](https://instagram.com/sportsgraphsofficial)

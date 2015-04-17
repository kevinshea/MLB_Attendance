

### select date, team, scores for home games
### changes home_score to team_score, visitor_score oppenent score
### union with visitors
### make the corresponding changes to account for visitor
### insert into new table
### then calculate current wins
CREATE TABLE IF NOT EXISTS temp_current_wins AS
  (SELECT Game_Date,
        Home_Team as Team,
        Home_Score as Team_Score,
        Visitor_Score as Opponent_Score
  FROM Games)
  UNION
  (SELECT Game_Date,
        Visitor_Team as Team,
        Visitor_Score as Team_Score,
        Home_Score as Opponent_Score
  FROM Games)
  ORDER BY Team, Game_Date;

set @prev := 2000, @wins := 0;

CREATE TABLE IF NOT EXISTS Current_Wins AS
 SELECT Game_Date,
        Team,
        Team_Score,
        Opponent_Score,
        IF(@prev = year(Game_Date),
              if(Team_Score > Opponent_Score, @wins := @wins +1, @wins := @wins),
              if(Team_Score > Opponent_Score, @wins := 1, @wins := 0)) as current_wins,
        @prev := year(Game_Date)
 FROM temp_current_wins
 ORDER BY Team, Game_Date;

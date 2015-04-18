set @prev := 2000, @wins := 0;

CREATE TABLE IF NOT EXISTS current_home_wins AS
  SELECT Game_Date,
        Home_Team,
        Home_Score,
        Visitor_Score,
        IF(@prev = year(Game_Date),
              if(Home_Score > Visitor_Score, @wins := @wins +1, @wins := @wins),
              if(Home_Score > Visitor_Score, @wins := 1, @wins := 0)) as current_home_wins,
        @prev := year(Game_Date)
  FROM Games
  ORDER BY Home_Team, Game_Date;

set @prev := 2000, @wins := 0;
CREATE TABLE IF NOT EXISTS current_road_wins AS
  SELECT Game_Date,
        Visitor_Team,
        Home_Score,
        Visitor_Score,
        IF(@prev = year(Game_Date),
              if(Home_Score < Visitor_Score, @wins := @wins +1, @wins := @wins),
              if(Home_Score < Visitor_Score, @wins := 1, @wins := 0)) as current_road_wins,
        @prev := year(Game_Date)
  FROM Games
  ORDER BY Visitor_Team, Game_Date;

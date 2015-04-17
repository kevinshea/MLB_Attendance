
## Creates a table which gives us the home game number for each game played
CREATE TABLE IF NOT EXISTS temp_home_number AS
  SELECT g.Game_Date,
         g.Day_of_Week,
         g.Home_Team,
         g.Day_or_Night,
         g.Attendance,
         hg.Home_Game_Number,
         g.park_ID
  FROM Games g
    JOIN Home_Games hg
      ON g.Game_Date = hg.Game_Date
      and g.Home_Team = hg.Home_Team;

## matches attendance of Home Game 1 for Team X with Home Game 1 of the prior year
## i.e. attendance for home opener of 2014 with home opener of 2013 regardless of
## date the game was played
CREATE TABLE IF NOT Exists Games_Prior_Attendance AS
SELECT thn2.Game_Date,
       thn2.Day_of_Week,
       thn2.Home_Team,
       thn2.Day_or_Night,
       thn2.Home_Game_Number,
       thn2.Attendance,
       thn1.Attendance as Prior_Attendance,
       thn2.park_ID
FROM temp_home_number thn1
  JOIN temp_home_number thn2
  ON thn1.Home_Game_Number = thn2.Home_Game_Number
    and thn1.Home_Team = thn2.Home_Team
    and year(thn1.Game_Date) = (year(thn2.Game_Date) - 1)
ORDER BY thn2.Game_Date;

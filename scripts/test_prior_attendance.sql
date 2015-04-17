CREATE TABLE IF NOT EXISTS test_Games AS
  SELECT *
  FROM Games
  WHERE Home_Team='CLE';

CREATE TABLE IF NOT EXISTS test_home_number AS
  SELECT tg.Game_Date,
         tg.Day_of_Week,
         tg.Home_Team,
         tg.Day_or_Night,
         tg.Attendance,
         hg.Home_Game_Number
  FROM test_Games tg
    JOIN Home_Games hg
      ON tg.Game_Date = hg.Game_Date
      and tg.Home_Team = hg.Home_Team;


SELECT thn2.Game_Date,
      thn2.Day_of_Week,
      thn2.Home_Team,
      thn2.Day_or_Night,
      thn2.Attendance,
      thn2.Home_Game_Number,
      thn1.Game_Date,
      thn1.Home_Team,
      thn1.Home_Game_Number,
      thn1.Attendance
FROM test_home_number thn1
  JOIN test_home_number thn2
  ON thn1.Home_Game_Number = thn2.Home_Game_Number
    and thn1.Home_Team = thn2.Home_Team
    and year(thn1.Game_Date) = (year(thn2.Game_Date) - 1);

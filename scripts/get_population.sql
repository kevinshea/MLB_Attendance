CREATE TABLE IF NOT EXISTS Games_Attend_Cwins_Pwins_Pop
SELECT gaw.Game_Date,
       gaw.Day_of_Week,
       gaw.Home_Team,
       gaw.Day_or_Night,
       gaw.Home_Game_Number,
       gaw.Attendance,
       gaw.Prior_Attendance,
       gaw.Current_Wins,
       gaw.Prior_Wins,
       pop.Population,
       gaw.park_ID
FROM Games_Attend_Cwins_Pwins gaw
  JOIN Population pop
  ON gaw.Home_Team = pop.Team
ORDER BY gaw.Game_Date;

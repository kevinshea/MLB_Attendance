CREATE TABLE IF NOT EXISTS Games_Regression AS
  SELECT gaw.Game_Date,
         gaw.Day_of_Week,
         gaw.Home_Team,
         gaw.Day_or_Night,
         gaw.Home_Game_Number,
         gaw.Attendance,
         gaw.Prior_Attendance,
         gaw.Current_Wins,
         gaw.Prior_Wins,
         gaw.Population,
         gaw.Team_Salary,
         (year(gaw.Game_Date) - year(p.Start_Date)) as "Park Age"
  FROM Games_AWPS gaw
    JOIN Parks p
    ON gaw.park_ID = p.parkID
  ORDER BY gaw.Game_Date;

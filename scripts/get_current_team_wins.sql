CREATE TABLE IF NOT EXISTS Games_Attend_Wins
SELECT gpa.Game_Date,
       gpa.Day_of_Week,
       gpa.Home_Team,
       gpa.Day_or_Night,
       gpa.Home_Game_Number,
       gpa.Attendance,
       gpa.Prior_Attendance,
       cw.current_wins as Current_Wins,
       gpa.park_ID
FROM Games_Prior_Attendance gpa
  JOIN Current_Wins cw
  ON gpa.Home_Team = cw.Team
    and gpa.Game_Date = cw.Game_Date
ORDER BY gpa.Game_Date;

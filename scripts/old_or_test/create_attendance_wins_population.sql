CREATE TABLE IF NOT EXISTS Home_Games_Attend_Win_Pop AS
SELECT gpa.Game_Date,
       gpa.Day_of_Week,
       gpa.Home_Team,
       gpa.Day_or_Night,
       gpa.Home_Game_Number,
       gpa.Attendance,
       gpa.Prior_Attendance,
       cw.current_wins as Current_Wins,
       t.W as Prior_Wins,
       p.Population
FROM Games_Prior_Attendance gpa
  JOIN Current_Wins cw
    ON gpa.Home_Team = cw.Team
      and gpa.Game_Date = cw.Game_Date
  JOIN Teams t
    ON gpa.Home_Team = t.teamID
    and year(gpa.Game_Date) = (t.yearID - 1)
  JOIN Population p
    ON gpa.Home_Team = p.Team
ORDER BY gpa.Game_Date;

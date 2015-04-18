## Step 3 of 6 for appending fields to build Games_Regression
## previously named get_previous_team_wins.sql

## using yearID + 1 because it works, though I don't know why
## want to match year(Game_Date) with prior year from Teams table
## i.e. Game_Date = 2001 then Teams.yearID = 2000
## Logically that should be year(gaw.Game_Date) = (t.yearID +1)
## but on that gives me GD = 2001, yearID = 2001, yearID -1 = 2002
## for some reason yearID + 1 gives me yearID 2000

CREATE TABLE IF NOT EXISTS Games_Attend_Cwins_Pwins AS
SELECT gaw.Game_Date,
       gaw.Day_of_Week,
       gaw.Home_Team,
       gaw.Day_or_Night,
       gaw.Home_Game_Number,
       gaw.Attendance,
       gaw.Prior_Attendance,
       gaw.Current_Wins,
       t.W as Prior_Wins,
       gaw.park_ID
FROM Games_Attend_Wins gaw
  JOIN Teams t
  ON gaw.Home_Team = t.teamID
  and year(gaw.Game_Date) = (t.yearID +1)
ORDER BY gaw.Game_Date;

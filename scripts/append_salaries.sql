## Step 5 of 6 for appending fields to build Games_Regression
## previously named get_salaries.sql

## use Salaries table from Lahman database
## sum salaries across players to get a team total
CREATE TEMPORARY TABLE IF NOT EXISTS temp_Salary AS
  SELECT yearID, teamID, sum(salary) as Team_Salary
  FROM Salaries
  GROUP BY yearID, teamID;

CREATE TABLE IF NOT EXISTS Games_AWPS AS
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
         s.Team_Salary,
         gaw.park_ID
  FROM Games_Attend_Cwins_Pwins_Pop gaw
    JOIN temp_Salary s
    ON gaw.Home_Team = s.teamID
    and year(gaw.Game_Date) = s.yearID
  ORDER BY gaw.Game_Date;

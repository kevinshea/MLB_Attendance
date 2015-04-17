SELECT g.Game_Date,
       g.Day_of_Week,
       g.Home_Team,
       g.Day_or_Night,
       g.Attendance,
       hg.Home_Game_Number
FROM Games g
  JOIN Home_Games hg
    ON g.Game_Date = hg.Game_Date
    and g.Home_Team = hg.Home_Team

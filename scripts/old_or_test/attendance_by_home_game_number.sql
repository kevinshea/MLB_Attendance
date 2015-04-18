SET @home_number:=0, @my_year=2014, @my_month=04, @my_team='CLE';
SELECT Game_Date,
       Home_Team,
       Home_Game_Number,
       Total_Outs,
       Attendance,
       @home_number:=@home_number+1 home_number
FROM Games
WHERE Home_Team=@my_team
GROUP BY year(Game_Date)

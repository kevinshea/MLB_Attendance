## Create a table with individual game information

CREATE TABLE Games
(
  Game_Date date,
  Day_of_Week varchar(255),
  Visitor_Team varchar(255),
  Visitor_Leage varchar(255),
  Visitor_Total_Games int,
  Home_Team varchar(255),
  Home_Leage varchar(255),
  Home_Total_Games int,
  Visitor_Score int,
  Home_Score int,
  Total_Outs int,
  Day_or_Night varchar(255),
  Park_ID varchar(255),
  Attendance int,
  Time_of_Game int
)

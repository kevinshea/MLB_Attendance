select rw.Game_Date,
from current_road_wins rw, current_home_wins hw
where (rw.Visitor_Team='CLE' and rw.year(Game_Date)=2014 and rw.month(Game_Date)=04)
  or (hw.Home_Team='CLE' and hw.year(Game_Date)=2014 and hw.month(Game_Date)=04)
order by 

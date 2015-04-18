## load game log information
## original source: retrosheets.org
## subset data using r, see create_game_logs.R

LOAD DATA Local INFILE '/Users/kshea421/DataAnalysis/MLBAttendance/Attendance/data_to_load/game_logs_2010-2014b.txt'
INTO TABLE Games
FIELDS TERMINATED by '\t'
IGNORE 1 lines;

## load ballpark information
## data source: retrosheet.org Ballpark codes
##

LOAD DATA INFILE '/Users/kshea421/DataAnalysis/MLBAttendance/parks_table.csv'
INTO TABLE Parks
FIELDS TERMINATED by ','
IGNORE 1 lines;

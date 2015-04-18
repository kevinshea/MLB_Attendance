## load table with population info for MLB cities
## populations are metro areas from 2010 U.S. census
## and 2011 Cananda census

LOAD DATA INFILE '/Users/kshea421/DataAnalysis/MLBAttendance/Attendance/data_to_load/msa_population_to_load.txt'
INTO TABLE Population
FIELDS TERMINATED by '\t'
IGNORE 1 lines;

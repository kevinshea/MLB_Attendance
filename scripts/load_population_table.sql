LOAD DATA INFILE '/Users/kshea421/DataAnalysis/MLBAttendance/Attendance/data_to_load/msa_population_to_load.txt'
INTO TABLE Population
FIELDS TERMINATED by '\t'
IGNORE 1 lines;

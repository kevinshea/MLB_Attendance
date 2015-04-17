setwd("~/DataAnalysis/MLBAttendance")

# read file created from retorsheets
game_logs <- read.table("retrosheet//game_logs_2000-2014.txt", sep="," )
# subset for columns we care about and name the columns
game_logs_subset <- game_logs[, c(1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 19)]
header_subset <- c("Game_Date", "Day_of_Week", "Visitor_Team", "Visitor_League", 
                   "Visitor_Total_Games", "Home_Team", "Home_League", 
                   "Home_Total_Games", "Visitor_Score", "Home_Score", 
                   "Total_Outs", "Day_or_Night", "Park_ID", "Attendance", "Time_of_Game")
names(game_logs_subset) <- header_subset

# format dates to yyyy-mm-dd
game_logs_subset[,1] <- as.character(game_logs_subset[,1])
game_logs_subset[,1] <- as.Date(game_logs_subset[,1], "%Y%m%d")
# write game log file to load into database
write.table(game_logs_subset, 
            file="Attendance/data_to_load/game_logs_2010-2014.txt", 
            sep="\t", row.names=FALSE)
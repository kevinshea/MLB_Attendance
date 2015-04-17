## GET RID of ZEROs in attendance!!!
## Make some functions so you can easily comment out things!!

setwd("~/DataAnalysis/MLBAttendance/Attendance/output")

## get file of attendance data
atten <- read.table("attendance_regression_data.txt", sep="\t", header=TRUE)

## subset to remove instances where Attendance == 0 or Prior_Attendance == 0
## these are typically due to how retrosheets counts attendance for double-headers
atten <- atten[which(atten$Attendance > 0 & atten$Prior_Attendance > 0),]

## create a list of the team ids to loop through
all_teams <- c("ANA", "ARI", "ATL", "BAL", "BOS", "CHA", "CHN", "CIN", "CLE", "COL", "DET", 
               "FLO", "HOU", "KCA", "LAN", "MIA", "MIL", "MIN", "MON", "NYA", "NYN",
               "OAK", "PHI", "PIT", "SDN", "SEA", "SFN", "SLN", "TBA", "TEX", "TOR", "WAS")

## create a list of all regression variables to loop through individually
## population variable is meaningless for individual team because it doesn't change 

regression_variables <- c("Prior_Attendance", "Current_Wins", "Prior_Wins", 
                          "Population", "Team_Salary", "Park.Age")

## Let's do some regressions!
## this will find regression for each Team-Variable combination
## CLE Attendance vs Prior Attendance, CIN Attendance vs Team_Salary etc

for (regression_var in regression_variables) {
  ## get the r-square variables
  
  rsq <- sapply(all_teams, function(team) 
                 summary(lm(atten[which(atten$Home_Team==team),c("Attendance")] ~ 
                              atten[which(atten$Home_Team==team), regression_var]))$r.squared)
  
  file_name = paste("rsq_by_team_", regression_var, ".txt", sep="")
  write.table(rsq, file_name, sep="\t", quote=FALSE)
  
  ## get the coefficients
  ## change row names so we know which corresponds to which
  
  coeff <- sapply(all_teams, function(team) 
            summary(lm(atten[which(atten$Home_Team==team),c("Attendance")] ~ 
                 atten[which(atten$Home_Team==team), regression_var]))$coefficients)
  
  file_name = paste("coefficients_by_team_", regression_var, ".txt", sep="")
  write.table(coeff, file_name, sep="\t", quote=FALSE)
}


## Let's regress across all teams!

## for each variable
rsq_all <- sapply(regression_variables, function(rv) summary(lm(atten$Attendance ~ atten[, rv]))$r.square)
coeff_all <- sapply(regression_variables, function(rv) summary(lm(atten$Attendance ~ atten[, rv]))$coefficients)
write.table(rsq_all, "rsq_all_each_variable.txt", sep="\t", quote=FALSE)
write.table(coeff_all, "coeff_all_each_variable.txt", sep="\t", quote=FALSE)


## get the r-square variables for combos!

## create a list of the team ids to loop through
all_teams <- c("ANA", "ARI", "ATL", "BAL", "BOS", "CHA", "CHN", "CIN", "CLE", "COL", "DET", 
               "FLO", "HOU", "KCA", "LAN", "MIA", "MIL", "MIN", "MON", "NYA", "NYN",
               "OAK", "PHI", "PIT", "SDN", "SEA", "SFN", "SLN", "TBA", "TEX", "TOR", "WAS")

rsq <- sapply(all_teams, function(team) 
         summary(lm(atten[which(atten$Home_Team==team),c("Attendance")] ~ 
               atten[which(atten$Home_Team==team), c("Prior_Attendance")] +
               atten[which(atten$Home_Team==team), c("Current_Wins")] +
               atten[which(atten$Home_Team==team), c("Prior_Wins")] +
               atten[which(atten$Home_Team==team), c("Park.Age")] 
               ))$r.squared)
write.table(rsq, "rsq_by_team_all_variables_except_pop.txt", sep="\t", quote=FALSE)

coeff <- sapply(all_teams, function(team) 
  summary(lm(atten[which(atten$Home_Team==team),c("Attendance")] ~ 
               atten[which(atten$Home_Team==team), c("Prior_Attendance")] +
               atten[which(atten$Home_Team==team), c("Current_Wins")] +
               atten[which(atten$Home_Team==team), c("Prior_Wins")] +
               atten[which(atten$Home_Team==team), c("Park.Age")] 
  ))$coefficients)

coeff_df <- data.frame(lNames = rep(names(coeff), lapply(coeff, length)),
             lVal = unlist(coeff))
write.table(coeff_df, "coefficients_by_team_all_variables_except_pop.txt", sep="\t", quote=FALSE)

#rsq_wins_pattend <- summary(lm(atten$Attendance ~ atten$Current_Wins+atten$Prior_Attendance))
rsq_all <- summary(lm(atten$Attendance ~ atten$Team_Salary +
             atten$Prior_Attendance + 
             atten$Current_Wins +
             atten$Prior_Wins +
             atten$Population + 
             atten$Park.Age))$r.squared

write.table(rsq_all, "rsq_all_all_variables.txt", sep="\t", quote=FALSE)

coeff_all <- summary(lm(atten$Attendance ~ atten$Team_Salary +
                        atten$Prior_Attendance + 
                        atten$Current_Wins +
                        atten$Prior_Wins +
                        atten$Population + 
                        atten$Park.Age))$coefficients

write.table(coeff_all, "coefficients_all_all_variables.txt", sep="\t", quote=FALSE)
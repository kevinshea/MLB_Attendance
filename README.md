### Process for gettting data ready to perform regressions

Will eventually result in single MySQL table Games_Regression

#### Data Sources

* Game Logs
..* Original source: [http://www.retrosheet.org/gamelogs/index.html]
..*  ~/data_to_load/game_logs_2010-2014b.txt
* Ballpark Info
..* Original source: [http://www.retrosheet.org/parkcode.txt]
..* ~/data_to_load/parks_table.csv
* Population
..* Original sources: U.S census 2010, Canada census 2011
..* ~data_to_load/msa_population_to_load.txt
* Lahman Database of Baseball Statistics
..* Original source: [http://www.seanlahman.com/baseball-archive/statistics/]

#### Calculating Key Values and Building Necessary Tables

1. Create and load tables for outside data sources above
2. Run script for calculating home game number (calculate and load into table)
..* Home Game Number - First home game of season equals one,
but could be 4th game of season
..* We use this number to compare home attendance to prior year
..* create_number_home_game.sql
..* load_Home_Games.sql
..* get_previous_attendance.sql
3. Calculate the current wins on the season
..* perform calculation to find out how many wins a team has at a given date
and load into table
..* create_current_wins.sql

#### Building the Games_Regression Table

This process could be built into a single script one query to perform
multiple joins, however, that makes it hard to debug. As a result,
multiple queries were written to produce the final table in piecemeal,
adding an additional column each time.

While a bit more convoluted, this makes it much easier to check and make sure
the data is loading as expected.

Note: The single script version would need to create a temp table for Team Salary

**Append Scripts**

1. Run script for finding prior year's attendance
..* Matches attendance of home game 1 for year to home game for prior year for each team's home games
..* append_previous_attendance.sql
2. Add field for current team wins
..* append_current_team_wins.sql
3. Add field for prior team wins
..* append_previous_team_wins.sql
4. Add field for population
..* append_population.sql
5. Add field for team salary
..* append_salaries.sql
6. Add field for park age
..* append_park_age.sql

#### Layout of Games_Regression Table

1. Game_Date
2. Day_of_Week
3. Home_Team
4. Day_or_Night
5. Home_Game_Number
6. Attendance
7. Prior_Attendance
8. Current_Wins
9. Prior_Wins
10. Population
11. Team_Salary
12. Park Age

### Performing Regressions

Output of Games_Regression tables serves as our data source for performing regressions with R.

Regressions were performed on team attendance across all teams and each team individually for the following variables

* Prior Attendance
* Current Wins
* Prior Wins
* Population
* Team Salary
* Park Age

These variables were assessed together as well as individually.

R-square values and coefficients were stored for exploration in Excel.

SET @prev := 'string';
SET @game_number := 1;

SELECT Game_Date,
      Home_Team,
      IF(@prev <> year(Game_Date), @game_number := 1, @game_number := @game_number +1) AS home_number,
      @prev := year(Game_Date) as year
FROM Games
ORDER BY Home_Team, Game_Date;

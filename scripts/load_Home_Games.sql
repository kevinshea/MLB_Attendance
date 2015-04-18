## performs calculation to determine which home game number a game is
## resets counter when team or year changes
## loads into Home_Games

SET @prev := 'string';
SET @game_number := 1;

INSERT INTO Home_Games
SELECT Game_Date,
      Home_Team,
      IF(@prev <> year(Game_Date), @game_number := 1, @game_number := @game_number +1) AS home_number,
      @prev := year(Game_Date) as year
FROM Games
ORDER BY Home_Team, Game_Date;

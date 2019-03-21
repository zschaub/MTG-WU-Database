Select player_name, Sum(game_wins) from t_tournament_player group by player_name;

Select * from t_player where player_name in (Select player_name from t_match where round_number = 3);

Select player_name from t_tournament_player having Sum(game_losses) > Sum(game_wins);
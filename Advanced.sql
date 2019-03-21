Select deck_name from t_deck d join t_deck_card dc on dc.deck_id = d.deck_id where dc.card_name = 'Swamp';

Select t.tournament_name, t.state from t_tournament t left join t_tournament_player tp on tp.tournament_name = t.tournament_name inner join t_player p on p.player_name = tp.player_name where p.player_name in ('Kenji Egashira', 'Reid Duke');

Create View NoTeamInMass As Select t.tournament_name, p.player_name inner join t_tournament_player tp on t.tournament_name = tp.tournament_name inner join t_player p on tp.player_name = p.player_name where t.state = 'MA' And p.team Is Null;
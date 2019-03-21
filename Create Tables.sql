Drop table if exists t_deck;
Drop table if exists t_player;
Drop table if exists t_match;
Drop table if exists t_banned_cards;
Drop table if exists t_card;
Drop table if exists t_set;
Drop table if exists t_format;
Drop table if exists t_tournament;
Drop table if exists t_tournament_format;
Drop table if exists t_tournament_player;
Drop table if exists t_player_match;
Drop table if exists t_player_deck;
Drop table if exists t_deck_format;
Drop table if exists t_deck_card;
Drop table if exists t_card_format;
Drop table if exists t_set_format;


Create Table t_tournament(
tournament_name varchar(20) not null,
date Date Not null,
city varchar(20) not null,
state varchar(2) not null,
country varchar(20) not null,
Constraint tournament_pk Primary Key (tournament_name)
);

Create Table t_format(
format_name varchar(20) not null,
constructed bit not null,
Constraint format_pk Primary Key (format_name)
);

Create Table t_set(
set_name varchar(42) not null,
release_date date not null,
set_size varchar(42) not null,
expansion_code varchar(3) not null,
Constraint set_pk Primary Key (set_name)
);

Create Table t_card(
card_name varchar(42) not null,
card_color varchar(42) not null,
card_type varchar(42) not null,
set_name varchar(42) not null,
Constraint card_pk Primary Key (card_name),
Constraint cardset_fk Foreign Key (set_name) References t_cardset(set_name)
);

Create Table t_banned_cards(
banned_id int not null,
format_name varchar(42) not null,
card_name varchar(42) not null,
Constraint banned_pk Primary Key (banned_id),
Constraint format_fk Foreign Key (format_name) references t_format(format_name),
Constraint card_fk foreign key (card_name) references t_card(card_name)
);

Create Table t_match(
match_id int not null,
round_number int not null,
results varchar(20) not null,
match_winner varchar(20) not null,
tournament_name varchar(20) not null,
Constraint match_pk Primary Key (match_id),
Constraint tournament_fk Foreign Key (tournament_name) References t_tournament(tournament_name)
);

Create Table t_player(
player_name varchar(20) not null,
Constraint player_pk Primary Key (player_name)
);

Create Table t_deck(
deck_id int not null,
deck_name varchar(20) not null,
deck_size int not null,
Constraint deck_pk Primary Key (deck_id)
)

Create Table t_tournament_format(
tournament_name varchar(20) not null,
format_name varchar(20) not null,
Constraint tf_pk Primary Key (tournament_name, format_name),
Constraint tournament_fk foreign key (tournament_name) references t_tournament(tournament_name),
Constraint format_fk foreign key (format_name) references t_format(format_name)
);

Create Table t_tournament_player(
tournament_name varchar(20) not null,
player_name varchar(20) not null,
match_wins int not null,
match_losses int not null,
game_wins int not null,
game_losses int not null,
Constraint tp_pk Primary Key (tournament_name, player_name),
Constraint tournament_fk foreign key (tournament_name) references t_tournament(tournament_name),
Constraint player_fk foreign key (player_name) references t_player(player_name)
);

Create table t_player_match(
player_name varchar(20) not null,
match_id int not null,
Constraint pm_pk Primary Key (player_name, match_id),
Constraint player_fk foreign key (player_name) references t_player(player_name),
Constraint match_fk foreign key (match_id) references t_match(match_id)
);

Create Table t_player_deck(
player_name varchar(20) not null,
deck_id int not null,
Constraint pd_pk Primary Key (player_name, deck_id),
Constraint player_fk foreign key (player_name) references t_player(player_name),
Constraint deck_fk foreign key (deck_id) references t_deck(deck_id)
);

Create Table t_deck_format(
deck_id int not null,
format_name varchar(20) not null,
Constraint df_pk Primary Key (deck_id, format_name),
Constraint deck_fk foreign key (deck_id) references t_deck(deck_id),
Constraint format_fk foreign key (format_name) references t_format(format_name)
);

Create Table t_deck_card(
deck_id int not null,
card_name varchar(40) not null,
Constraint dc_pk Primary Key (deck_id, card_name),
Constraint deck_fk foreign key (deck_id) references t_deck(deck_id),
Constraint card_fk foreign key (card_name) references t_card(card_name)
);

Create Table t_card_format(
card_name varchar(40) not null,
format_name varchar(20) not null,
Constraint cf_pk Primary Key (card_name, format_name),
Constraint card_fk foreign key (card_name) references t_card(card_name),
Constraint format_fk foreign key (format_name) references t_format(format_name)
);

Create Table t_set_format(
set_name varchar(42) not null,
format_name varchar(42) not null,
Constraint sf_pk Primary Key (set_name, format_name),
Constraint set_fk foreign key (set_name) references t_set(set_name),
Constraint format_fk foreign key (format_name) references t_format(format_name)
);
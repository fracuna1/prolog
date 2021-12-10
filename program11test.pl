%felicia acuna csc240 program11
% This program is a list of facts listed
% as actor,movieRole,movie,town,and parentOf
% that make up a knowledge base of a movie family

actor(charlie_chaplin,london,1889,1977).
actor(bruce_lee,san_francisco,1940,1973).
actor(david_carradine,los_angeles,1936,2009).
actor(christian_bale,haverfordwest,1974,living).
actor(kirk_douglas,amsterdam_ny,1916,living).

movieRole(charlie_chaplin,king_shadov,a_king_in_new_york).
movieRole(bruce_lee,lee,enter_the_dragon).
movieRole(david_carradine,kwai_chang,kung_fu).
movieRole(christian_bale,quinn_abercromby,reign_of_fire).
movieRole(kirk_douglas,vincent_van_gogh,lust_for_life).

movie(a_king_in_new_york,1957,charlie_chaplin).
movie(enter_the_dragon,1973,robert_clouse).
movie(kung_fu,1986,richard_lang).
movie(reign_of_fire,2002,rob_bowman).
movie(lust_for_life,1956,vincente_minnelli).

town(seattle,washington,united_states,724745).
town(edmonton,alberta,canada,981280).
town(riverton,wyoming,united_states,11058).
town(cambridge,na,england,123900).
town(boston,massachusetts,united_states,685094).

parentOf(dr_emmett_brown,marty_mcfly).

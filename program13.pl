%Felicia Acuna
%program 13
%this program is a quest game that takes the user
%through a series of options to complete the quest.


% assign the state that will start the program
%
start_state(village).

% define the edges of the finite state diagram


next_state(village,a,weapons).
next_state(village,b,armor).
next_state(village,c,leave_Roana).

next_state(weapons,a,village).
next_state(weapons,b,village).
next_state(weapons,c,village).


next_state(armor,a,village).
next_state(armor,b,village).
next_state(armor,c,village).
next_state(armor,d,village).

next_state(leave_Roana,a,left1).
next_state(leave_Roana,b,right1).
next_state(leave_Roana,c,straight1).

next_state(left1,a,battle1):-
    stored_answer(have_weapon,yes).

next_state(left1,a,death):-
    stored_answer(have_weapon,no).

next_state(left1,b,death).
next_state(left1,c,death).
next_state(left1,d,leave_Roana).

next_state(right1,a,cave).
next_state(right1,b,right1).
next_state(right1,c,right1).
next_state(right1,d,right1).


next_state(straight1,a,leave_Roana).
next_state(straight1,b,leave_Roana).
next_state(straight1,c,leave_Roana).
next_state(straight1,d,leave_Roana).

next_state(battle1,a,leave_Roana).
next_state(battle1,b,leave_Roana).
next_state(battle1,c,death).
next_state(battle1,d,death).


next_state(cave,a,bridge_path).
next_state(cave,b,staircase_path).
next_state(cave,c,cave).
next_state(cave,d,cave).

next_state(bridge_path,a,boss_fight).
next_state(bridge_path,b,death).
next_state(bridge_path,c,bridge_path).
next_state(bridge_path,d,cave).

next_state(staircase_path,a,staircase_path).
next_state(staircase_path,b,death).
next_state(staircase_path,c,staircase_path).
next_state(staircase_path,d,cave).

next_state(boss_fight,a,death).
next_state(boss_fight,b,death).

next_state(boss_fight,c,quest_completed_with_treasure):-
     stored_answer(have_key,yes).

next_state(boss_fight,c,quest_completed):-
     stored_answer(have_key,no).

next_state(boss_fight,d,death).











% code to be executed at the beginning...
display_intro :-
 write('Welcome to Roana!'),
 write('You are tasked a quest.'),nl,
 write('Your choices will determine'),nl,
 write('whether you live or die! '),nl,
 write('Adventure well my friend.'),nl,nl.

initialize :-
 asserta(stored_answer(moves,0)),
 asserta(stored_answer(treasure,0)),
 asserta(stored_answer(have_weapon,yes)),
 asserta(stored_answer(have_weapon,no)),
 asserta(stored_answer(have_armor,yes)),
 asserta(stored_answer(have_armor,no)),
 asserta(stored_answer(have_key,yes)),
 asserta(stored_answer(have_key,no)).

goodbye :-
 stored_answer(moves,Count),
 write( 'You made this many moves...' ),
 write( Count ), nl,
 stored_answer(treasure,Amount),
 write( 'You have this much gold... ' ),
 write( Amount ), nl,
 write('pieces'),nl,
 write( 'Live well and prosper'), nl.

show_state(village):-
    write('You are in the village'),nl,
    write(' of Roana.'),nl,nl,
    write('Would you like to..'),nl,
    write('(a) Buy a weapon'),nl,
    write('(b) Buy some armor'),nl,
    write('(c) Leave Roana'),nl,
    write('(q) Quit the adventure'),nl.

show_state(weapons):-
    write('Welcom to the '),nl,
    write('weapons shop.'),nl,nl,
    write('Would you like a'),nl,
    write('(a) Sword'),nl,
    write('(b) Axe'),nl,
    write('(c) Toothbrush'),nl,
    write('(q) Quit the adventure'),nl.

show_state(armor):-
    write('Welcome to the '),nl,
    write('armor shop.'),nl,nl,
    write('Would you like a'),nl,
    write('(a) Shield'),nl,
    write('(b) Helm'),nl,
    write('(c) Greaves'),nl,
    write('(d) Breast plate'),nl,
    write('(q) Quit the adventure'),nl.

show_state(leave_Roana):-
    write('Welcome to the '),nl,
    write('village border.'),nl,nl,
    write('Would you like to'),nl,
    write('(a) Go left'),nl,
    write('(b) Go right'),nl,
    write('(c) Go straight'),nl,
    write('(q) Quit the adventure'),nl.

show_state(left1):-
    write('you leave the villiage'),nl,
    write('and encouter some bandits'),nl,nl,
    write('Do you want to'),nl,
    write('(a) Pull out a weapon'),nl,
    write('(b) Cower in fear'),nl,
    write('(c) Plead for your life'),nl,
    write('(d) Run away'),nl,
    write('(q) Quit the adventure'),nl.

show_state(right1):-
    write('you leave the village'),nl,
    write('and walk for a while.'),nl,
    write('You finally come across'),nl,
    write('a dungeon covered in moss'),nl,nl,
    write('Would you like to'),nl,
    write('(a) Enter the cave'),nl,
    write('(b) Sit down and rest'),nl,
    write('(c) Look at your surroundings'),nl,
    write('(d) Listen intently'),nl,
    write('(q) Quit the adventure'),nl.

show_state(straight1):-
     write('you leave the villiage'),nl,
    write('and come to a dead end.'),nl,
    write('There is a key on the ground'),nl,nl,
    write('Do you want to'),nl,
    write('(a) Pick up the key'),nl,
    write('(b) Go back'),nl,
    write('(c) Examine the the key'),nl,
    write('(d) Reevaluate your life'),nl,
    write('(q) Quit the adventure'),nl.

show_state(battle1):-
    write('Your weapon is drawn.'),nl,nl,
    write('Would you like to..'),nl,
    write('(a) Aim for their head'),nl,
    write('(b) Aim for their chest'),nl,
    write('(c) Aim for their leg'),nl,
    write('(d) Aim for their arm'),nl,
    write('(q) Quit the adventure'),nl.

show_state(cave):-
    write('In the cave a few minutes later..'),nl,
    write('There are two paths, the first'),nl,
    write('is a rickety bridge and the'),nl,
    write(' second is a winding staircase.'),nl,nl,
    write('Would you like to..'),nl,
    write('(a) Go across the bridge'),nl,
    write('(b) Go up the staircase'),nl,
    write('(c) Look down the abyss'),nl,
    write('(d) Inspect the staircase'),nl,
    write('(q) Quit the adventure'),nl.

show_state(bridge_path):-
    write('You finally make it to'),nl,
    write('the other side and see'),nl,
    write('large ornate door.'),nl,nl,
    write('Would you like to..'),nl,
    write('(a) Peek inside the door'),nl,
    write('(b) Push open the doors with a bang'),nl,
    write('(c) Look through the keyhole'),nl,
    write('(d) Go back'),nl,
    write('(q) Quit the adventure'),nl.


show_state(staircase_path):-
    write('You walk for what feels'),nl,
    write('like ages before you come'),nl,
    write('to a large opening in the path'),nl,nl,
    write('Would you like to..'),nl,
    write('(a) Look inside'),nl,
    write('(b) Go into the opening'),nl,
    write('(c) Listen for any danger'),nl,
    write('(d) Go back'),nl,
    write('(q) Quit the adventure'),nl.

show_state(boss_fight):-
    write('As you sneak in you notice a troll.'),nl,
    write('All trolls have a weak spot when'),nl,
    write('they are attacked in surprise.'),nl,
    write('Choose wisely adventurer'),nl,nl,
    write('Would you like to..'),nl,
    write('(a) Attack his neck'),nl,
    write('(b) Attack his heart'),nl,
    write('(c) Attack his back'),nl,
    write('(d) Attack his stomache'),nl,
    write('(q) Quit the adventure'),nl.

show_state(quest_completed_with_treasure):-
     write('Congratulations '),nl,
    write('fellow adventurer.'),nl,
    write('You defeated your'),nl,
    write('enemies and completed'),nl,
    write('your quest!!'),nl,
    write('GAME OVER....'),nl.



show_state(quest_completed):-
    write('Congratulations '),nl,
    write('fellow adventurer.'),nl,
    write('You defeated your'),nl,
    write('enemies and'),nl,
    write('completed your quest'),nl,
    write('GAME OVER....'),nl.

show_state(death):-
    write('YOU ARE DEAD! '),nl,
    write('You were killed'),nl,
    write('by your foe.'),nl,
    write('Your quest was failed,'),nl,
    write('GAME OVER....'),nl.


get_choice(quest_completed_with_treasure,q).

get_choice(quest_completed,q).

get_choice(death,q).

% code to be executed for each choice of action from each state...
show_transition(village,a) :-
 write( 'You leave to go '),nl,
 write('to the weapons shop '),nl,nl.

show_transition(village,b) :-
 write( 'You leave to go '),nl,
 write('to the armor shop '),nl,nl.

show_transition(village,c) :-
 write( 'You leave your home'),nl,
 write(' and head to the'),nl,
 write(' village border'),nl,nl.


show_transition(weapons,a) :-
 write( 'You chose the sword'),nl,
 write(' it has an attack'),nl,
 write(' damage of 40 points'),nl,nl,
 retract(stored_answer(have_weapon,no)),
 asserta(stored_answer(have_weapon,yes)).

show_transition(weapons,b) :-
 write( 'You chose the axe'),nl,
 write(' it has an attack'),nl,
 write(' damage of 40 points'),nl,nl,
 retract(stored_answer(have_weapon,no)),
 asserta(stored_answer(have_weapon,yes)).


show_transition(weapons,c) :-
 write( 'You chose the toothbrush'),nl,
 write(' it has an attack'),nl,
 write(' damage of 100 points'),nl,nl,
 retract(stored_answer(have_weapon,no)),
 asserta(stored_answer(have_weapon,yes)).


show_transition(armor,a) :-
 write( 'You chose the shield'),nl,
 write(' it has a defense'),nl,
 write('amount of 15 points'),nl,nl.

show_transition(armor,b) :-
 write( 'You chose the helm'),nl,
 write(' it has a defense'),nl,
 write('amount of 15 points'),nl,nl.

show_transition(armor,c) :-
 write( 'You chose the greaves'),nl,
 write(' it has a defense'),nl,
 write('amount of 15 points'),nl,nl.

show_transition(armor,d) :-
 write( 'You chose the breast plate'),nl,
 write(' it has a defense'),nl,
 write('amount of 15 points'),nl,nl.

show_transition(leave_Roana,a) :-
 write( 'You chose to go left'),nl,nl.

show_transition(leave_Roana,b) :-
 write( 'You chose to go right'),nl,nl.

show_transition(leave_Roana,c) :-
 write( 'You chose to go straight'),nl,nl.


show_transition(left1,a) :-
    stored_answer(have_weapon,yes),
 write( 'You chose to pull out a weapon'),nl,
 write(' and defend yourself'),nl,nl.

show_transition(left1,a) :-
  stored_answer(have_weapon,no),
 write( 'You did not equip a weapon'),nl,
 write('to defend yourself'),nl,nl.

show_transition(left1,b) :-
 write( 'You cower in fear and'),nl,
 write('pray they ignore you'),nl,nl.

show_transition(left1,c) :-
 write( 'You beg for your life and'),nl,
 write('hope they will show mercy'),nl,nl.

show_transition(left1,d) :-
 write( 'You run away in fear'),nl,
 write('back towards the village'),nl,nl.

show_transition(right1,a) :-
 write( 'You enter the dark cave not'),nl,
 write('knowing if enemies are abound'),nl,nl.

show_transition(right1,b) :-
 write( 'You are exhausted and sit'),nl,
 write('down for a bit of a rest'),nl,nl.

show_transition(right1,c) :-
 write( 'You look around and notice'),nl,
 write('a squirrel on a tree'),nl,nl.

show_transition(right1,d) :-
 write( 'You listen and hear'),nl,
 write('strange sounds coming'),nl,
 write('from the cave, it'),nl,
 write('sounds like goblins'),nl,nl.

show_transition(straight1,a) :-
 write( 'You pick up the key'),nl,
 retract(stored_answer(have_key,no)),
 asserta(stored_answer(have_key,yes)).

show_transition(straight1,b) :-
 write( 'You ignore the key and'),nl,
 write(' head back'),nl,nl.

show_transition(straight1,c) :-
 write( 'You look at the key and see'),nl,
 write('some strange elvish markings'),nl,nl.

show_transition(straight1,d) :-
 write( 'You think about the choices'),nl,
 write('that you have made in life.'),nl,
 write('You realize life is great'),nl,
 write('and you shouldnt think too much'),nl,nl.

show_transition(battle1,a) :-
 write( 'You swing for their head'),nl,
 write('and hit them straight down'),nl,
 write('the middle. Your foe died'),nl,
 write('from thier injuries,'),nl,
 write('your enemies flee and'),nl,
 write('you win the battle'),nl,nl.

show_transition(battle1,b) :-
 write( 'You swing for their chest'),nl,
 write('and hit them right in'),nl,
 write('the heart. Your foe died'),nl,
 write('from thier injuries, your'),nl,
 write('enemies flee and you win'),nl,nl.

show_transition(battle1,c) :-
 write( 'You swing for their leg'),nl,
 write('and miss, your foe attacks'),nl,
 write('and kills you'),nl,nl.

show_transition(battle1,d) :-
 write( 'You swing for their arm,'),nl,
 write('you miss and hit'),nl,
 write('yourself in the side.'),nl,
 write('you die from your injuries'),nl,nl.


show_transition(cave,a) :-
 write( 'You head towards the'),nl,
 write('bridge unsure of whether'),nl,
 write('it is safe to cross'),nl,nl.

show_transition(cave,b) :-
 write( 'You head towards the'),nl,
 write('winding staircase, it'),nl,
 write('looks as if it will go'),nl,
 write(' on forever'),nl,nl.

show_transition(cave,c) :-
 write( ' "Beware that, when fighting'),nl,
 write('monsters, you yourself do not'),nl,
 write('become a monster.. for when'),nl,
 write('you gaze long into the abyss.'),nl,
 write('The abyss gazes also into you" '),nl,nl.

show_transition(cave,d) :-
 write( 'You look at the staircase,'),nl,
 write('it is made of stone from'),nl,
 write('the cave and looks sturdy.'),nl,nl.

show_transition(bridge_path,a) :-
 write( 'You peek inside,'),nl,
 write('there seems to be a shadow'),nl,
 write('but you cant be sure.'),nl,
 write('You might want to be quiet.'),nl,nl.

show_transition(bridge_path,b) :-
 write( 'As the doors slam open,'),nl,
 write('you are ambushed and suffer'),nl,
 write('serious injuries, you die.'),nl,nl.

show_transition(bridge_path,c) :-
 write( 'You peek through the keyhole,'),nl,
 write('there is a large creature'),nl,
 write('sitting in front of a chest.'),nl,nl.

show_transition(bridge_path,d) :-
 write( 'You decide to go back,'),nl,
 write('this path is far to scary.'),nl,nl.

show_transition(staircase_path,a) :-
 write( 'You look inside and see,'),nl,
 write('at least a dozen sleeping goblins.'),nl,
 write('its best to go back, only a fool.'),nl,
 write(' would wake sleeping goblins'),nl,nl.

show_transition(staircase_path,b) :-
 write( 'You go into the opening,'),nl,
 write('all of the goblins wake up.'),nl,
 write('They look really grumpy.'),nl,
 write('The goblins attack you and'),nl,
 write('you are overwhelmed, you die.'),nl,nl.

show_transition(staircase_path,c) :-
 write( 'You hear very loud snoring,'),nl,
 write('it sounds like someone is '),nl,
 write('enjoying a very nice nap.'),nl,nl.

show_transition(staircase_path,d) :-
 write( 'you head back the other way,'),nl,
  write('this path is boring.'),nl,nl.

show_transition(boss_fight,a) :-
 write( 'You go to attack the trolls,'),nl,
 write('neck, he notices you. He grabs.'),nl,
 write('you and sqeezes the life out of you.'),nl,
 write('You die in his hands...'),nl,nl.

show_transition(boss_fight,b) :-
 write( 'As you head towards the troll,'),nl,
 write('he sees you and stomps on'),nl,
 write('your head.'),nl,
 write('Your skull is crushed and'),nl,
 write('you succumb to your wounds...'),nl,nl.

show_transition(boss_fight,c) :-
 write( 'You defeated the boss!' ),nl,
 write('As you stabbed him in the'),nl,
 write('back you hit a magical jewel.'),nl,
 write('This jewel was his only weak spot'),nl,
 write( 'You walk over to the chest' ),nl,
 write('and begin to open it'),nl,
 stored_answer(have_key,no),
 write('You dont have the key'),nl,
 write('you end this quest goldless'),nl,nl.

show_transition(boss_fight,c) :-
 write( 'You defeated the boss!' ),nl,
 write('As you stabbed him in the'),nl,
 write('back you hit a magical jewel.'),nl,
 write('This jewel was his only weak spot'),nl,
 write( 'You walk over to the chest' ),nl,
 write('and begin to open it'),nl,
 stored_answer(have_key,yes),
 stored_answer(treasure,Amount),
 retract(stored_answer(treasure,_)),
 NewAmount is Amount + 1000.00,
 asserta(stored_answer(treasure,NewAmount)).

show_transition(boss_fight,d) :-
 write( 'You charge at the troll,'),nl,
 write('as you get closer he sees'),nl,
 write('you. He Grabs both of your'),nl,
 write('arms and tears them off.'),nl,
 write('You die from your wounds...'),nl,nl.

















% basic finite state machine engine
go :-
intro,
start_state(X),
show_state(X),
get_choice(X,Y),
go_to_next_state(X,Y).

intro :-
display_intro,
clear_stored_answers,
initialize.

go_to_next_state(_,q) :-
goodbye,!.

go_to_next_state(S1,Cin) :-
next_state(S1,Cin,S2),
show_transition(S1,Cin),
show_state(S2),
stored_answer(moves,K),
OneMoreMove is K + 1,
retract(stored_answer(moves,_)),
asserta(stored_answer(moves,OneMoreMove)),
get_choice(S2,Cnew),
go_to_next_state(S2,Cnew).

go_to_next_state(S1,Cin) :-
\+ next_state(S1,Cin,_),
show_transition(S1,fail),
get_choice(S1,Cnew),
go_to_next_state(S1,Cnew).


get_choice(_,C) :-
 write('Next entry (letter '),
 write('followed by a period )? '),nl,
 read(C).

% case knowledge base - user responses
:- dynamic(stored_answer/2).

% procedure to get rid of previous responses
% without abolishing the dynamic declaration
clear_stored_answers
 :- retract(stored_answer(_,_)),fail.
clear_stored_answers.





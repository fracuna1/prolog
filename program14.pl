%Felicia Acuna CSC240 Program 14
%This program ask's the user a series of questions
%to help them decide where to vacation based on climate
%choice and gives an estimate of the average price
%per week not including flight cost.
go :-
    intro,
    write( 'answer all questions y for yes or n for no.'),nl,
    clear_stored_answers,
    try_all_possibilities.

try_all_possibilities :-
    may_be(D),
    explain(D),
    fail.

try_all_possibilities.

:- dynamic(stored_answer/2).

clear_stored_answers :- retract(stored_answer(_,_)),fail.
clear_stored_answers.

user_says(Q,A) :- stored_answer(Q,A).

user_says(Q,A) :-
    \+ stored_answer(Q,_),
    nl,nl,
    ask_question(Q),
    get_yes_or_no(Response),
    asserta(stored_answer(Q,Response)),
    Response = A.

get_yes_or_no( Result ) :-
    get(Char),
    get0(_),
    interpret(Char,Result),
    !.



get_yes_or_no( Result ):-
    nl,
    write('Type y or n'),
    get_yes_or_no( Result ).

interpret(89,yes).
interpret(121,yes).
interpret(78,no).
interpret(110,no).

intro :-
    write('This program helps you to pick where '),nl,
    write('you would like to vacation and gives '),nl,
    write('a price estimate of weekly costs '),nl.

may_be(no_vacation) :-
    user_says(no_vacation,yes).

%may_be(yes_vacation) :-
  %  user_says(vacation,yes).

%may_be(no_vacation) :-
 %   user_says(vacation,no).

may_be(brazil) :-
  user_says(no_vacation,no),
%user_says(vacation,yes),
    user_says(warm,yes),
    user_says(tropical,yes),
    user_says(brazil,yes).

may_be(bahamas) :-
  user_says(no_vacation,no),
%    user_says(vacation,yes),
    user_says(warm,yes),
    user_says(tropical,yes),
    user_says(bahamas,yes).

may_be(australia) :-
  user_says(no_vacation,no),
% user_says(vacation,yes),
    user_says(warm,yes),
    user_says(desert,yes),
    user_says(australia,yes).

may_be(africa) :-
    user_says(no_vacation,no),
    %user_says(vacation,yes),
    user_says(warm,yes),
    user_says(desert,yes),
    user_says(africa,yes).

may_be(iceland) :-
    user_says(no_vacation,no),
   % user_says(vacation,yes),
    user_says(cool,yes),
    user_says(sub_arctic,yes),
    user_says(iceland,yes).

may_be(canada) :-
    user_says(no_vacation,no),
    %user_says(vacation,yes),
    user_says(cool,yes),
    user_says(sub_arctic,yes),
    user_says(canada,yes).

may_be(china) :-
     user_says(no_vacation,no),
    %user_says(vacation,yes),
    user_says(cool,yes),
    user_says(humid,yes),
    user_says(china,yes).

may_be(sweden) :-
     user_says(no_vacation,no),
   % user_says(vacation,yes),
    user_says(cool,yes),
    user_says(humid,yes),
    user_says(sweden,yes).


ask_question(no_vacation) :-
    write('Are you NOT taking vacation?'),nl.

ask_question(warm) :-
    write('Do you want warm weather?'),nl.

ask_question(tropical) :-
    write('Did you choose tropical climate?'),nl.

ask_question(desert) :-
    write('Did you choose a desert climate?'),nl.

ask_question(sub-arctic) :-
    write('Did you choose a sub-arctic climate?'),nl.

ask_question(humid) :-
    write('Did you choose humid continental climate?'),nl.

ask_question(brazil) :-
    write('Would you like to go to Brazil?'),nl.

ask_question(bahamas) :-
    write('Would you like to go to the Bahamas?'),nl.

ask_question(australia) :-
    write('Would you like to go to Australia?'),nl.

ask_question(africa) :-
    write('Would you like to go to South Africa?'),nl.

ask_question(iceland) :-
    write('Would you like to go to Iceland?'),nl.

ask_question(canada) :-
    write('Would you like to go to Canada?'),nl.

ask_question(china) :-
    write('Would you like to go to China?'),nl.

ask_question(sweden) :-
    write('Would you like to go to Sweden?'),nl.


explain(no_vacation) :- nl,
    write('You should take a vacation!'),nl.

explain(brazil) :- nl,
    write('You chose Brazil the average cost per week is $280'),nl.

explain(bahamas) :- nl,
    write('You chose the Bahamas the average cost per week is $942'),nl.

explain(australia) :- nl,
    write('You chose the Australia the average cost per week is $1189'),nl.

explain(africa) :- nl,
    write('You chose South Africa the average cost per week is $1563'),nl.

explain(iceland) :- nl,
    write('You chose Iceland the average cost per week is $1638'),nl.

explain(canada) :- nl,
    write('You chose Canada the average cost per week is $1750'),nl.

explain(china) :- nl,
    write('You chose China the average cost per week is $900'),nl.

explain(sweden) :- nl,
    write('You chose Sweden the average cost per week is $790'),nl.




%	Testing and Data

test_mcsam(Name,UnderstoodStory) :-
	story(Name,Story), mcsam(Story,UnderstoodStory).

story(test,[[ptrans, john, john, X1, leones],
       [ingest, X2, hamburger, X3],
       [ptrans, Actor, Actor, X4, X5] ]).

script(restaurant,
       [ [ptrans, Actor, Actor, Earlier_place, Restaurant],
         [ptrans, Actor, Actor, Door, Seat],
         [mtrans, Actor, Waiter, Food],
         [ingest, Actor, Food, [mouth, Actor] ],
         [atrans, Actor, Money, Actor, Waiter],
         [ptrans, Actor, Actor, Restaurant, Gone] ],
       [ [Actor, customer], [Earlier_place, place1],
         [Restaurant, restaurant], [Door, door],
         [Seat, seat], [Food, meal], [Waiter, waiter],
         [Money, check], [Gone, place2] ] ).

trigger(leones, restaurant).  trigger(waiter, restaurant).

%	Program 14.17:   Testing McSAM

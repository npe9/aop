/* 

Rule base for a simple expert system for placing dishes in an oven.
The predicates used in the rules are
    place_in_oven(Dish,Rack)   :-
    	Dish should be placed in the oven at level Rack for baking.
    pastry(Dish) :-  Dish is a pastry.
    main_meal(Dish) :-  Dish is a main meal.
    slow_cooker(Dish) :-  Dish is a slow cooker.
    type(Dish,Type) :-  Dish is best described as Type.
    size(Dish,Size) :-  The size of Dish is Size.

The rules have the form rule(Head,Body,Name).
*/


:- op(40,xfy,&).
:- op(30,xf,is_true).


rule(place_in_oven(Dish,top),
    pastry(Dish) is_true & size(Dish,small) is_true,place1).
rule(place_in_oven(Dish,middle),
    pastry(Dish) is_true & size(Dish,big) is_true,place2).
rule(place_in_oven(Dish,middle),main_meal(Dish) is_true,place3).
rule(place_in_oven(Dish,bottom),slow_cooker(Dish) is_true,place4).

rule(pastry(Dish),type(Dish,cake) is_true,pastry1).
rule(pastry(Dish),type(Dish,bread) is_true,pastry2).

rule(main_meal(Dish),type(Dish,meat) is_true,main_meal).

rule(slow_cooker(Dish),type(Dish,milk_pudding) is_true,slow_cooker).

fact(type(dish1,bread)).
fact(size(dish1,big)).

%  Program 17.17: Oven placement rule-based system

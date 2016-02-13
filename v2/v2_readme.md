This is a set of changes made after reading through Chapter 3.

-Getting a grip on dependencies

-One class needs to of another class, of the arguments (names, order)

This chapter was all about controlling dependencies.  You get a dependency whenever one class needs to know the name, arguments (name, number, order), or methods (name, arguments(name, number, order)) of another class.  It's really more than that too - there might be times when you are counting on a method to deliver a certain sort of result, and if that changes, then you're in trouble.  But I suppose that reducing these name-type dependencies is a serious start.  One thing that she didn't say is that it's best to avoid having public methods of a class take parameters at all, if possible.  Maybe sometimes, you absolutely must to make use of the functionality the thing provides, but even then, that is another thing to be isolated and publicly identified.  If Faraday needs a url, but you're always going to be sending requests to the same place, then make a wrapper for it for the specific use case.

Metz's suggestions: dependency injection, isolation in the initialization method, isolation elsewhere, wrapper modules

######### Review of Where Things Stand

dependencies:
 - menu controller: menu, gamecontroller, game(through gamecontroller)
 - game controller: oldgamestore, movecontroller, game
 - move controller: move
 - menu: none!
 - game: board
 - move: none!
 - board: none!

Ok, so not too bad overall!  Ideally, we'd just get rid of oldgamestore.  That woould help a lot.
Beyond that, it would be great if move-controller didn't have the strong dependecy on game.  And maybe if game didn't have the dependency on board.  I'll work on that, and see if we can't reduce the dependencies.

###### While working

no tests around the menu controller, really
and no game_controller_spec at all

Really, there are more dependencies than stated above.  Board needs to know that move_list is an array of Moves, and it needs to know a lot about moves.


#################

Final thoughts:
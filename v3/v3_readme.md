This is a set of changes made after reading through Chapter 4.

Flexible public interfaces
 - focus on messages, and minimizing the messages that can be sent, getting the right ones sent
 - build the classes you need around the kinds of messages you want to send
 - law of demeter: talk only to your neighbors

######### Review of Where Things Stand

Messages I would want to send:
 - start the game
  - should be sent by overall controls to the controls for a given game
 - display the board at a given time
  - should be sent by the controls for a given game to the game itself
  - and the game should know how to accomplish this
 - make a move
  - should be sent by the controls for a game to the game itself

This makes me question the controller-model split that I have for the game.  Should the game know how to deal with a command to begin?  Seems to work pretty well the way I have it - if you have a game controller controlling the action, and the model is just a(n active) record.  (Er - or is it that once a record becomes too active, it's started to act like a controller, making changes and all that.  Not sure.)  The controller gathers and responds to input.  The model controls the records.  The view displays the records.

One thing I can work on here is testing - test all and only the (truly) public methods.
Another thing I can do is to investigate when I have things that are working in oo-style and when I have things that are working procedurally.

###### While working

#################

Final thoughts:
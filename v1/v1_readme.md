This is a set of changes made after reading through Chapter 1.

Single Responsibility Principle: every class and method does the minimal useful thing
 - Should help preserve the ability to make changes later

Epistemology:
 - does it make sense to ask an instance of a class about the information relating to a method?
   - 'Mr. Gear, what is your number of teeth?'  -good
   - 'Mr. Gear, what are your gear-inches?' -bad
 - can you describe the function of a class/method in a single sentence?

How to Achieve:
  - put some distance between you and the data
    - hide instance variables
    - hide data structures
  - extract extra responsibilities from methods into additional methods
  - extract extra responsibilities from classes into additional classes

#########

How am I doing? My brief description
Controller - control the overall flow, call the other classes, glue together other pieces
Game - collect information related to the game overall
Move - provide information about a single move
Board - display the current game state
Menu - display menu

After reviewing
Controller
Game
Move
Board
Menu - combines two function: what the menu information is, and how it is displayed; the latter should be a controller function

# 8BallPool
Recreation of the game 8 ball pool!!


DEVELOPMENT LOG!!!

Thursday May 16
  -Both: Got our prototype approved and began messing around adding the framework and background images. Not much progress made(night before AP), but a little experimentation at the start.

Friday May 17th - Sunday May 19th
  -Both: Not much more work, but added some classes and functions from the prototype


Monday May 20th:
  -Kevin: Created the setup for the pool table -> stick, cue ball, and the 15 colored balls.
          Need to figure out how to differentiate stripes and solids as well as stick rotation.
  -Oliver: Added Power bar which shows how hard the ball is going to be hit, with color and gives that power to the ball when released

Tuesday May 21st:
  -Kevin: Worked on getting the stick to hit the ball and have it go forward.
  -Oliver: Worked on getting the ball to bounce and creating roper angles.

Wednesday May 22nd:
  -Both: Figured out merge conflicts and branching strategy going forward.
  -Oliver: Created the code to detect when a ball is pocketed and having it disappear(for now).
  -Thanks to Kaitlyn Duong for helping with the idea of changing angles the ball bounces off for the right wall to test the pocketing before we can actually change the game to incorporate angle.

Thursday May 23rd:
  -Both: AP's the next day so we didn't do much but in class Kevin finished the rotation feature of the cue and hitting the ball at an angle on his branch.

Friday May 24th-Monday May 27th
  -Oliver: THE BALL STOPS (Adding friction)
  -Kevin: The Stick now follows the ball, rotates about the ball and pushes the ball in the angle that it is supposed to
  -Kevin: Fixed transferSpeed and transferPower to make it more realistically visually
  -Oliver: The Stick disappears upon pushing the ball
  -Oliver: Working on colliding bouncing on on walls

Tuesday May 28th:
  -Oliver:Getting balls to react with each other
  -Kevin:
Wednesday May 29th:
  -Kevin: Color differentiation between stripes, and solids.
  -Kevin: Created "bags" for storing balls when put into hole (for future usage when displaying)
  -Oliver: Working on collisions between balls and fixing

Thursday May 30th:
  -Kevin: Updating README
  -Both: Trying to fix wall collisions for non-white balls. Got advice from Mr K. to separate operations and "use inheritance more effectively", but in an attempt to do so broke our whole project...WHOOPS.
  -Oliver: Went back to old-state on a branch and started working forward again

Friday May 31st-Tuesday June 4th:
-Oliver: Changed ball collision radius to be more effective. Started to get balls to collide with the proper angles
-Kevin: Added lines to show where the ball would end up
-Oliver: Figured out how to detect the angle at which the ball should go by drawing line from hitting point to center of the other ball. Worked on fine tuning this because it still didn't always go the right way. Figured out a way to make break "work".
-Kevin: Worked on way to have balls collide without duplicates with solid but not perfect success.
-Oliver: Started working on an ambitious alternate way to make them collide will holding Kevin's partially working solution. 
-Kevin: created ArrayList that shows balls that have been hit into holes and displays it.

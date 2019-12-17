# Ruby Art Studio

This is a program that stochastically generates an image in the following manner:

1. Define a number of anchor points.
2. Randomly distribute these anchor points as colored pixels in the image.
3. Define a number of 'lifecycles' for the simulation to run through.
4. For each lifecycle, sample a location on the image.
  * If the location is adjacent to a colored pixel, color it as well.
  * If the location lacks neighbors, leave it colorless.
  * Treat the image as a toroidal plane.
5. View your work of art!


All you've got to do is run `ruby painting.rb` and your painting.png file should be updated when the code executes. 

_(You may need to install the chunkypng gem which is used to generate and paint the png file)_


## The Future

I may come back to this in the future to tinker with the program some more. Goals include:
- Refactoring code to be less like a script and more OOP.
- Accepting user input for seed and lifecycle values.
- Accepting flexibility in colors for the picture.
- Including flexible rulesets for different stochastic simulation options.
  * Requiring neighbors within a certain range to be set to active
  * Requiring neighbors of a certain color to be set to active
  * Allowing simulation of different style neighborhoods.

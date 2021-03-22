# Filming set using Processing
## Description
This is an applicaton that emulates an imaginary filming studio of a park
## How it works
In order to use the application you just have to run the main file. It will show you the set I designed and the visualization controls you can use, which are:
* Press 'Y' to bring the morning
* Press 'U' to bring the afternoon
* Press 'I' to bring the night
* Press 'O' to bring to turn off the lights
* Press 'H' to open or exit the help
* Press 'R' to reset the application

The camera controls are:
* Left click and drag to rotate de camera
* Mouse wheel to zoom in and out
* Right click and vertical drag to modify zoom
* Double left click to reset the camera

**IMPORTANT:** in order to use the camera you need to install the Peasycam library from the Processing tools section.

## Implementation decisions
This application has been developed according to the principles of Jakob Nielsen. It's easy to use, makes the user feels the control at every moment and uses a minimalist and simple design. It is not possible for the user to generate any programming error so it hasn't been necessary to control the user's movements. The controls are at hand at every moment so it's not possible for the user to get lost using the application.
For the camera movements I have decided to use an external library known as "PeasyCam" which makes quite easier to manage the camera in less lines.
There are 4 lights modes:
* Morning: it shows a fully illuminated version of the park.
* Afternoon: it shows a half illuminated version of the park imitating a sunset. You can adjust de lighted point moving the mouse in this mode.
* Night: it shows a less illuminated version of the park lighted just by a street light.
* No light: it shows nothing, there is no light so it won't be possible for the user to see any element of the filming set.
## Application demonstration
![Example](https://github.com/Samuel-AQ/Processing-filming-set/blob/master/data/images/example.gif?raw=true)
## References
* [Processing documentation](https://processing.org/reference/)
* [Peasycam](http://mrfeinberg.com/peasycam/)
* [Set shapes](https://free3d.com/)
## Other info
* Author: Samuel Arrocha Quevedo
* Version: 22/03/2021

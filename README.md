# CIU-4-PlanetarySystemShip
The fourth of a series of projects for the subject **Creando Interfaces de Usuario** using Processing 3. This one consisted in modifying the planetary system of the last proyect, [CIU-3-PlanetarySystem](https://github.com/CarlosBritoPerez/CIU-3-PlanetarySystem), by adding a first person view.

*Author - Carlos Brito Pérez*

## INDEX
- Introduction
- Implementation
  - States
  - Controls
- Result
- Limitations
- References

## Introduction
A visual representation of a fictional planetary system consisting in a star, 5 planets and a satellite.
## IMPLEMENTATION
### States
- **Visual.** The base state of the program.
- **Ship.** A first person view where the user can move freely
### Controls
- **Visual.**
  - PRESS ENTER to chage states. 
- **Ship.**
  - PRESS ENTER to chage states.
  - PRESS W/A/S/D to move the perspective.
  - PRESS UP/DOWN/LEFT/RIGHT to move in the X and Y axis.
  - PRESS SPACEBAR/SHIFT to move forward and backward.
## RESULT
![view](https://user-images.githubusercontent.com/72495040/156935105-79bfb635-037f-4672-8e26-f8cc8d4dbc78.gif)

##LIMITATIONS
The movement was implemented using the camera() function, this make the work easier but it doesn't feel like you are actually moving, instead it feels like you are moving the world around you.
## REFERENCES
https://github.com/otsedom/otsedom.github.io/blob/main/CIU/P4/README.md

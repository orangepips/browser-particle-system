# browser-particle-system

Solution for "In-browser Particle System" from http://asymmetrik.com/programming-challenges/

 1. clone repository 
 1. setup http server - simple solution is run the following on a *nix or Mac: `python -m http.server --cgi 8000`
 1. open http://localhost:8000/index.html in a browser. 

Uses [Processing 3](https://processing.org/) to create various animations and [Processing JS](http://processingjs.org/) to render in browser. 

# Problem Description

We are developing a simple side scrolling in-browser game and we need a flexible engine for controlling particle systems. We need you to author a Javascript and HTML-based implementation of a basic 2d engine that can simulate different kinds of particles. Your solution must implement at least two of the following simulation types to demonstrate its extensibility:

 * Snow blowing and falling
 * Rain falling
 * Leaves tumbling down
 * A swarm of insects

We have provided some basic requirements [1] for your solution, so please review these carefully.

## [1] REQUIREMENTS

 * The system should draw a pane that is at least 400×400.
 * You must allow the user to play and pause the simulation.
 * You must allow the user to toggle between two simulation modes (eg. snow vs rain).
 * The solution must be extensible to adding more simulation types.
 * The simulation must be capable of running indefinitely.
 * Be creative and incorporate your own effects and style. Also, there is nothing wrong with leveraging any of the common open source frameworks for building web pages and visualizations.

# References 

 * [Working with Processing and Processing JS](http://processingjs.org/articles/PomaxGuide.html)
 * [How to switch Processing sketches with JavaScript](http://stackoverflow.com/a/11200193/470838)

# PDE Files 

Where processing sketch code was taken from. 

 * [Leaves](http://www.openprocessing.org/sketch/163035)
 * [Rain](http://www.openprocessing.org/sketch/210804) 
 * [Snow](http://solemone.de/demos/snow-effect-processing/)


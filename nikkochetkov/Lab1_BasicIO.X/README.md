Mykyta O. Kochetkov, DK-42 group / Кочетков Микита Олександрович, група ДК-42 / [@nikkochetkov](https://github.com/nikkochetkov)

Lab1_basicIO is the first laboratory project for our PIC32 course.
In this project we studied basics of PIC32 microcontroller, such as General purpose inputs/outputs (GPIOs).
Our task was to study how does the GPIOs work, configure them so they could work properly, and to use them in our project.
To complete the task I've written simple program using C programming language.
In this program I'm using two buttons and four leds, to create the " BOMB defusing game ".
Do you remember those moments in movies when there is a bomb, and you need to defuse it by choosing one of two wires and cutting it?
Now you have the opportunity to try it out, without harming yourself or anybody else with my project!
As you might have guessed, buttons are playing a role of two wires, and you need to choose "which wire to cut" by clicking one of the buttons.
When the button is pressed, you need to wait some time, and then after a drumroll performed by leds, there is a result!
So describing it in two words, we've used buttons to activate a randomizer between 1 or 0.
Then if it's 1(one), the button you've pressed is the right button, all leds will blink signaling that bomd is defused.
And if it's 0(zero), the wrong button pressed, you will see the explosion animation ( leds will turn on by rotation from the central two leds)
If both buttons are pressed, you will see the explosion animation.
If none of the buttons are preseed leds will show the waiting animation.
Thanks for your attention!
!!!WARNING!!!
Makefile was created automaticaly for my project directories, so if you want to use it, you'll need to rewrite the makefile for your directories!													
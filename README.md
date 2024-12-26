# Alternative 3D Map Viewer for Mode 8 in DIV 2 Games Studio

This program allows navigation through 3D maps (mode 8) of DIV2 Games Studio with modern controls:
You can move the camera with the mouse, jump by pressing the spacebar, move using the WASD keys, duck holding control and run by holding the shift keys.
In this link there is an example of gameplay: [https://www.youtube.com/watch?v=nmAo820fvyQ]

How to build:
The program is designed to be compiled using DIV2 Games Studio, a game development framework for MS-DOS, compatible also with Windows 95 and Windows 98.
You can also run this framework on modern computers through DosBox (see this link [https://www.elgeneralfailure.com/2024/12/haciendo-funcionar-div-2-games-studio.html]).

Change the map:
Use the constants FILE_WLD and FILE_FPG to specify the map you want to load and its associated texture file.

Change the resolution:
You can change the resolution by modifying the constants SCREEN_SIZE_X and SCREEN_SIZE_Y.
Only the following resolutions are supported: 320x200, 320x240, 360x240, 360x360, 376x282, 640x400, 640x480, 800x600, and 1024x768.

Change the frames per second:
You can set the frames per second by modifying the constant GAME_FPS. You can also experiment with the FRAMESKIP constant, but ideally, this second constant should have low values.

Using Debug Mode:
There is a routine that displays information about the actual frames per second and RAM usage. To activate it, set the constant IS_DEBUG to 1. For the routine to work correctly, you must also specify your system's total RAM in the constant TOTAL_MEMORY_MB (value in MB).

License :
Copyright (c) 2024 Sebastián José Moncho Maquet (aka Le Hamster ruso).
All rights reserved. Permission to use, copy, modify, and distribute this software and its documentation for any purpose is not granted without explicit prior permission from the copyright holder. If you're a developer, I don't mind if you copy and paste parts of my code, just make sure to include me in the acknowledgments of your credits.

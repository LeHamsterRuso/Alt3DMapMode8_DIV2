# Alternative 3D Map Viewer in Mode 8 for DIV 2 Games Studio

This program allows navigation through 3D maps (mode 8) of DIV2 Games Studio with modern controls:
You can move the camera with the mouse, jump by pressing the spacebar, move using the WASD keys, duck holding control and run by holding the spacebar.

Change the map:  
Use the constants FILE_WLD and FILE_FPG to specify the map you want to load and its associated texture file.  

Change the resolution:  
You can change the resolution by modifying the constants SCREEN_SIZE_X and SCREEN_SIZE_Y.  
Only the following resolutions are supported: 320x200, 320x240, 360x240, 360x360, 376x282, 640x400, 640x480, 800x600, and 1024x768.  

Change the frames per second:  
You can set the frames per second by modifying the constant GAME_FPS. You can also experiment with the FRAMESKIP constant, but ideally, this second constant should have low values.  

License :
Copyright (c) 2024 Sebastián José Moncho Maquet (aka Le Hamster ruso)
All rights reserved. Permission to use, copy, modify, and distribute this software and its documentation for any purpose is not granted without explicit prior permission from the copyright holder.

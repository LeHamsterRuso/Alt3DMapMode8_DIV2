/*
    Alternative 3D Map Viewer in Mode 8 for DIV 2 Games Studio
    Le Hamster ruso, 2024
*/

PROGRAM ALT3DMAP;

CONST
    SCREEN_SIZE_X = 640;     /* Used for screem resolution */
    SCREEN_SIZE_Y = 480;     /* Used for screem resolution */
    GAME_FPS=60;             /* Frames per second */
    FRAMESKIP=10;            /* Frame skip */
    IS_DEBUG = 0;            /* 1 = shows debug info */
    TOTAL_MEMORY_MB = 32;    /* Define here your RAM memory */
    ADVANCE_UNIT = 40;       /* Step speed */


    FILE_WLD = "HELP\WLD_VIEW.WLD";    /* Map to load */
    FILE_FPG = "HELP\WLD_VIEW.FPG";    /* Map's textures */

BEGIN
    set_mode(SCREEN_SIZE_X*1000 + SCREEN_SIZE_Y);
    set_fps(GAME_FPS,FRAMESKIP);

    load_fpg(FILE_FPG);
    load_wld(FILE_WLD,0);

    camera();

    if (IS_DEBUG) writeDebugInfo(); end
END


/*****************
    Main camera
******************/
PROCESS camera()
PRIVATE
    mouse_xBefore;
    zBefore;
    jumpHeight;
    isJumping;
    originalHeight;
    originalEyeHeight;
BEGIN
    start_mode8(id, 0, 0);
    ctype=c_m8;
    height=128;
    radius=64;
    m8.height=128;
    go_to_flag(0);
    mouse_xBefore = mouse.x;
    jumpHeight = 0;
    isJumping = 0;

    originalHeight = height;
    originalEyeHeight = m8.height;

    loop
        if (key(_esc)) exit("Bye", 0); end

        /* Lateral movement */
        if (key(_d)) xadvance(angle-90000,16); end
        if (key(_a)) xadvance(angle+90000,16); end

        /* Move forward (SHIFT for run) */
        if (key(_w))
            if(key(_l_shift) or key(_r_shift))
                advance(ADVANCE_UNIT);
            else
                advance(ADVANCE_UNIT/4);
            end
        end

        /* Move backward (SHIFT for run) */
        if (key(_s))
            if (key(_l_shift) or key(_r_shift))
                advance(-ADVANCE_UNIT/2);
            else
                advance(-ADVANCE_UNIT/8);
            end
        end

        /* Jump and gravity */
        if (key(_space) and not isJumping and zBefore == z)
            isJumping = 1;
            jumpHeight = 30;
        end

        if (isJumping)
            z = z + jumpHeight;
            jumpHeight = jumpHeight - 2;
            if (jumpHeight <= 0)
                isJumping = 0;
            end
        else
            z -= 25;
        end
        zBefore = z+25;

        /* Duck */
        if (key(_control))
            height = originalHeight * 2 / 3;
            m8.height = originalEyeHeight * 2 / 3;
        else
            height = originalHeight;
            m8.height = originalEyeHeight;
        end

        /* Mouse - Camera */
        angle -= (mouse.x - mouse_xBefore) * 350;
        m8.angle = 128 - (mouse.y*256)/(SCREEN_SIZE_Y);

        if (mouse.x <= 0 or mouse.x >= (SCREEN_SIZE_X-1))
            mouse.x = SCREEN_SIZE_X/2;
        end
        mouse_xBefore = mouse.x;

        frame;
    end
end

/******************************
 Writes optional information
 ******************************
- Current frames per second
- Minimum FPS value detected
- Maximum FPS value detected
- RAM used
- RAM available */
PROCESS writeDebugInfo()
PRIVATE
    mem_used;
    mem_free;
    max_fps = 0;
    min_fps = 100;

BEGIN
    write_int(0, 0, 0, 0, &fps);
    write_int(0, 0, 8, 0, &min_fps);
    write_int(0, 0, 16, 0, &max_fps);
    write_int(0, 0, 24, 0, &mem_used);
    write_int(0, 0, 32, 0, &mem_free);

    loop
        mem_free = memory_free();
        mem_used = (TOTAL_MEMORY_MB * 1024) - mem_free;
        if (min_fps > fps) min_fps = fps; end
        if (max_fps < fps) max_fps = fps; end

        frame;
    end
END
# Black Ops 3 Auto-Splitter Info

The auto-splitter is could definitely use some dynamic memory searching to be more reliable. Either way, it works perfectly as intended for the main versions of the game. Currently, the load remover and auto-splitter is set up to function on both Nightmares AND Campaign. You can easily set this up by creating a "Scriptable Auto-Splitter" layer on your livesplit layout and applying the .ASL script from the releases to it.


# Black Ops 3 Auto-Splitter Settings

**Start**: This will determine if the livesplit timer will automatically start when you start your run

**Split**: This will determine if the auto-splitter is on or off

**Reset**: This will determine if the timer will be reset whenever you reset your campaign stats (only useful for NG so you don't have to manually reset the timer)

**Load Remover**: Pauses the "Game Time" timer whenever the game is loading. In order for this to work, you must have a "Game Time" timer on your layout. It is recommended that you have both "Game Time" and "Real Time" timers to make verification easier.

**Remove Fast-Loads**: Disables the load remover removing fast-loads. Recommended you leave this on unless the memory code breaks.

**Remove Map Load-out Sequence**: Disables the load remover removing the mission load-out sequence possibly because the code has a chance of breaking on co-op. Recommended you do leave this on unless the memory code breaks.

**IL Mode**: Enabling this will make the timer reset everytime the mission restarts and automatically start the timer whenever the mission briefing appears on any mission which is intended for in-level speedruns. If you are speedrunning full-game, turn this setting off.

**Reset by Skipto**: Enabling this will make the timer reset everytime the mission restarts by checking if the skipto memory code jumped from 0 to 8.

**Split by Skipto**: When IL mode is enabled, this setting will auto-split everytime you encounter a new skipto (excluding the first three skiptos: 0, 8, & 16). You will need to make sure that you know the exact amount of skiptos per map.

**Map Safeguard**: This will add a fail-safe where the game checks if the previous mission was really complete or not before splitting.

**Auto-Split Missions**: This will determine if the auto-splitter will function on the desired mission(s)

# Known Issues
- Memory codes break in co-op lobbies (fast-loads on the load remover doesn't work, auto-splitter only works for host). You can avoid some of these issues by disabling the **Remove Fast-Loads**.

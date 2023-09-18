# Black Ops 3 Auto-Splitter Info

The auto-splitter is currently setup using A LOT of memory codes. An update could mess this whole thing up. For it's current state, it works perfectly as intended for the US version on steam. If you run through any bugs, please report it to me on discord (*Ndt#8844* // *@NdtXBL*) and I will try my best to find a new memory code. Currently, the load remover is setup to function on both Nightmares AND Campaign. However, the auto-splitter is only intended on Campaign so far, so there is a chance you may encounter issues on Nightmares. You can easily set this up by creating a "Scriptable Auto-Splitter" layer on your livesplit layout and applying the .ASL script from the releases to it.


# Black Ops 3 Auto-Splitter Settings

**Start**: This will determine if the livesplit timer will automatically start when you start your run

**Split**: This will determine if the auto-splitter is on or off

**Reset**: This will determine if the timer will be reset whenever you reset your campaign stats (only useful for NG so you don't have to manually reset the timer)

**Mission Dialog Safeguard**: This will add a fail-safe where the game checks for the mission dialog before splitting

**Load Remover**: Pauses the "Game Time" timer whenever the game is loading. In order for this to work, you must have a "Game Time" timer on your layout. It is recommended that you have both "Game Time" and "Real Time" timers to make verification easier.

**Remove Fast-Loads**: Disables the load remover removing fast-loads. Recommended you leave this on unless the memory code breaks.

**OG Fast-Loads**: Uses the OG fast-loads memory code. Doesn't include the entire fast-load (only includes 6/8 of it). Known to break after retriggering a death warp that has been done already and in co-op lobbies.

**Remove Map Load-out Sequence**: Disables the load remover removing the mission load-out sequence possibly because the code has a chance of breaking on co-op. Recommended you do leave this on unless the memory code breaks.

**IL Mode**: Enabling this will make the timer reset everytime the mission restarts and automatically start the timer whenever the mission briefing appears on any mission which is intended for in-level speedruns. If you are speedrunning full-game, turn this setting off.

**Reset by Skipto**: When IL mode is enabled, this setting will force the timer to reset when the skipto memory code goes from 0 to 8. This is a safer way of resetting the timer.

**Split by Skipto**: When IL mode is enabled, this setting will auto-split everytime you encounter a new skipto (excluding skiptos: 0, 8, & 16). You will need to make sure that you know the exact amount of skiptos per map.

**Auto-Split Missions**: This will determine if the auto-splitter will function on the desired mission(s)

# Known Issues
- Memory codes break in co-op lobbies (fast-loads/mission load-out sequence on the load remover doesn't work, auto-splitter only works for host). You can avoid some of these issues by disabling the **Remove Campaign Fast-Loads** and **Remove Mission Load-out Sequence** toggles.

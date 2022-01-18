# Template Bezel Core Mod

## Description
This is a template Bezel CoreMod. Bezel CoreMods perform modifications to the base game's logic via editing the compiled AS3 bytecode.

## Installing the mod
### Important warning! Template Bezel Core Mod depends on [Bezel Mod Loader](https://github.com/gemforce-team/BezelModLoader).
#### This mod really shouldn't be installed, and instead serve as a mod programmer's template. There is no reason to install it, as it performs exactly one text edit, and it could theoretically cause issues for another mod that may wish to perform similar edits.

# Bug reports and feedback
If you feel that some aspect of coremodding should be better explained here, please use [the issue tracker](https://github.com/gemforce-team/TemplateBezelCoreMod/issues) to bring it to our attention.

This template was built by piepie62, who can be found on GemCraft's Discord server, if you wish to ask for more information: https://discord.gg/ftyaJhx - piepie62#3412

# Disclaimer
This is not an official modification.

GemCraft - Frostborn Wrath and GemCraft - Chasing Shadows are developed and owned by [gameinabottle](http://gameinabottle.com/)

# A Note on Decompilation and Syntax
[JPEXS](https://github.com/jindrapetrik/jpexs-decompiler) is super useful for finding where things are, and often for looking at bytecode. However, the bytecode that Bezel uses is generated by a modified version of rabcdasm. Bezel's bytecode is very, very close to JPEXS's output, but some things (especially labels) are different.

Rather than trying to guess, there is a way to see what Bezel uses as the bytecode it edits. Bezel includes a tool (splitter.exe) alongside its modified rabcdasm and rabcasm (named disassemble.exe and reassemble.exe, respectively). In order to use this, go to your GCFW data folder's Bezel folder (on Windows with the Steam version, this is at `%APPDATA%\com.giab.games.gcfw.steam\Local Store\Bezel Mod Loader`). Within the `tools` directory, there will be a `splitter.exe`. To use it, make a folder within the Bezel Mod Loader folder, open CMD within that new folder, then run `..\tools\splitter.exe ..\Lattice\game-clean.basasm`. This folder will now contain the entire directory structure that Bezel uses internally, with the syntax of the asasm files exactly matching what Bezel searches for.

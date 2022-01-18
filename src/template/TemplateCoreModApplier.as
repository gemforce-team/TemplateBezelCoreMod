package template 
{
	import Bezel.Lattice.Lattice;
	/**
	 * ...
	 * @author Chris
	 */
	public class TemplateCoreModApplier 
	{
		internal static const VERSION:String = "1";
		internal static function installCoremods(lattice:Lattice):void
		{
			// lattice.doesFileExist allows you to possibly check versions of a game, as well as which game the mod is running on
			// Because GCFW and GCCS are so similar, this mod can work for both with a little modification
			if (lattice.doesFileExist("com/giab/games/gcfw/Main.class.asasm"))
			{
				TemplateCoreMod.logger.log("installCoremods", "Found GCFW, installing coremod");
				installTemplateCoremod(lattice, "gcfw");
			}
			else
			{
				TemplateCoreMod.logger.log("installCoremods", "Found GCCS, installing coremod");
				installTemplateCoremod(lattice, "gccs/steam");
			}
		}
		
		private static function installTemplateCoremod(lattice:Lattice, baseGame:String):void
		{
			// First, decide which file you need to edit. Classes' files are named <package>.<class name>.class.asasm
			var filename:String = "com/giab/games/" + baseGame + "/scr/ScrMainMenu.class.asasm";
			// Then find the line that you need to edit. This is done through searching for snippets around where you want to edit
			// Note that for some edits, the same line might appear twice. This is fine, it just means that you need to add more context
			// so that you don't edit the wrong location
			var offset:int = lattice.findPattern(filename, /pushstring \"Start Game\"/);
			// If the result returned is -1, then that pattern is not present in the file. It's possible the game may have updated, making the coremod
			// no longer valid. I recommend logging this, as it could help debugging issues later.
			if (offset == -1)
			{
				TemplateCoreMod.logger.log("installTemplateCoremod", "Could not find proper place to apply gem coremod!");
				return;
			}

			// Finally, add or edit your line. Because we're replacing a line, we use the offset - 1 as our location, and 1 to indicate the number of lines we replace
			lattice.patchFile(filename, offset - 1, 1, "pushstring \"TAKEN OVER\"");
		}
	}

}

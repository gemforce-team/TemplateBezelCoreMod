package template
{
	import Bezel.Bezel;
	import Bezel.BezelCoreMod;
	import Bezel.Events.EventTypes;
	import Bezel.Events.IngameNewSceneEvent;
	import Bezel.Lattice.Lattice;
	import Bezel.Logger;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Chris
	 */
	public class TemplateCoreMod extends MovieClip implements BezelCoreMod 
	{
		// Name of the mod. This should be unique to your mod!
		public function get MOD_NAME():String { return "TemplateCoreMod"; }
		// Version of Bezel this mod was built for.
		// Bezel will not load mods that were built for a different major version (first number) or a newer minor version (second number) than was installed!
		public function get BEZEL_VERSION():String { return "2.0.1"; }
		// Version of the mod.
		public function get VERSION():String { return "0.0.2"; }
		// Because applying coremods takes a long time, there is a separate field for coremod version. This allows changing normal mod logic in an update
		// without editing the coremod, skipping having to reapply this coremod
		public function get COREMOD_VERSION():String { return TemplateCoreModApplier.VERSION; }
		
		public static var logger:Logger;
		
		public function TemplateCoreMod()
		{
			logger = Logger.getLogger("TemplateCoreMod");
		}
		
		public function bind(loader:Bezel, gameObjects:Object):void
		{
		}
		
		public function unload():void
		{
		}
		
		// The heart of coremodding: this is where you get your context and use it and your information to change the game.
		// The actual logic here has been split off to a different class for organizational purposes, but everything that happen there could
		// be done here with no issues.
		public function loadCoreMod(lattice:Lattice):void
		{
			TemplateCoreModApplier.installCoremods(lattice);
		}
	}
	
}

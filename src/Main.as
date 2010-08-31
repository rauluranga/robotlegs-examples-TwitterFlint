package  
{
	import com.grupow.debug.Log;
	import com.grupow.debug.targets.WSOSTarget;
	import com.grupow.debug.targets.WTraceTarget;
	import com.grupow.examples.twitter.MainContext;

	import flash.display.MovieClip;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class Main extends MovieClip
	{

		private var context:MainContext;

		public function Main() 
		{	
			Log.verbose = Config.DEBUG_MODE;
			Log.registerTarget(new WTraceTarget());
			Log.registerTarget(new WSOSTarget());
			
			context = new MainContext(this, true);
		}
	}
}
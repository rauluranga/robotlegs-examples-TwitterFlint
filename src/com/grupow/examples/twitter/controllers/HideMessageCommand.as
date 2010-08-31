package com.grupow.examples.twitter.controllers 
{
	import com.grupow.examples.twitter.models.TweetsModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @autor Raul Uranga
	 */
	public class HideMessageCommand extends Command 
	{
		[Inject]
		public var model:TweetsModel;
		
		public function HideMessageCommand()
		{
			
		}
		
		override public function execute():void 
		{
			model.hideTweetMessage();
		}
	}
}

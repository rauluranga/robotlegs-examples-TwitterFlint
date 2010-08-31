package com.grupow.examples.twitter.controllers 
{
	import com.grupow.examples.twitter.models.TweetsModel;
	import com.grupow.examples.twitter.events.TwitterEvent;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class ShowMessageCommand extends Command 
	{
		[Inject]
		public var event:TwitterEvent;

		[Inject]
		public var model:TweetsModel;
		
		public function ShowMessageCommand()
		{
			
		}
		
		override public function execute():void 
		{
			model.showTweetMessage(event.index);
		}
	}
}

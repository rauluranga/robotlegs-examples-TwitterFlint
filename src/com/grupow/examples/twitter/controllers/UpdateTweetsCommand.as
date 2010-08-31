package com.grupow.examples.twitter.controllers 
{
	import com.grupow.examples.twitter.events.TwitterEvent;
	import com.grupow.examples.twitter.events.TwitterServiceEvent;
	import com.grupow.examples.twitter.models.TweetsModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class UpdateTweetsCommand extends Command 
	{
		[Inject]
		public var event:TwitterServiceEvent;
		
		[Inject]
		public var model:TweetsModel;
		
		public function UpdateTweetsCommand()
		{
		}
		
		override public function execute():void 
		{
			model.tweets = event.messages;
			eventDispatcher.dispatchEvent(new TwitterEvent(TwitterEvent.SHOW_TWEETS));
		}
	}
}

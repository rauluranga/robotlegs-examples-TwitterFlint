package com.grupow.examples.twitter.controllers
{
	import com.grupow.examples.twitter.services.ITwitterService;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */

	public class SearchTweetsCommand extends Command
	{
		[Inject]
		public var service:ITwitterService;

		override public function execute():void 
		{
			service.searchMessages(Config.HASHTAG, Config.MAX_TWEETS);
		}
	}
}
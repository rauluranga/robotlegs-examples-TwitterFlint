package com.grupow.examples.twitter.events 
{
	import com.grupow.examples.twitter.data.TweetData;

	import flash.events.Event;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TwitterEvent extends Event 
	{
		public static const SHOW_MESSAGE:String = "showMessage";
		public static const HIDE_MESSAGE:String = "hideMessage";

		public static const SHOW_TWEETS:String = "show_tweets";
		public static const HIDE_TWEETS:String = "hide_tweets";

		public static const SHOW_MESSAGE_REQUEST:String = "show_message_request";
		public static const HIDE_MESSAGE_REQUEST:String = "hide_message_request";

		public var data:TweetData;
		public var index:uint;

		public function TwitterEvent(type:String) 
		{ 
			super(type, false, false);
		} 

		override public function clone():Event 
		{
			var event:TwitterEvent = new TwitterEvent(type);
			event.data = data;
			event.index = index;
			return event;
		}
	}
}


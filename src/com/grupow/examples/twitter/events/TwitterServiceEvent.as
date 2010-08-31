package com.grupow.examples.twitter.events 
{
	import flash.events.Event;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TwitterServiceEvent extends Event 
	{
		public static const DATA_COMPLETE:String = "data_complete";

		public var messages:Array;
		
		public var query:String = null;
		public var number:Number = 0;

		public function TwitterServiceEvent(type:String) 
		{ 
			super(type, false, false);
		} 

		override public function clone():Event
		{
			var event:TwitterServiceEvent = new TwitterServiceEvent(type);
			event.query = query;
			event.number = number;			event.messages = messages;
			return event;	
		}
	}
}
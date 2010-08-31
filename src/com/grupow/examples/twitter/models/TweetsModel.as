package com.grupow.examples.twitter.models 
{
	import com.grupow.examples.twitter.data.TweetData;
	import com.grupow.examples.twitter.events.TwitterEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TweetsModel extends Actor 
	{
		public var tweets:Array;
		public var detailIsOpen:Boolean;
		public var currentData:TweetData;

		private var _tweetVisited:Array;
		private var _currentIndex:int;

		public function TweetsModel() 
		{
			_tweetVisited = [];
		}

		public function getTweetData(id:uint):TweetData 
		{
			var data:TweetData = tweets[id] as TweetData;
			return data;
		}

		public function addViewed(tweetID:String):void 
		{
			if (_tweetVisited.indexOf(tweetID) == -1) {
				_tweetVisited.push(tweetID);
			}
		}

		public function isViewed(tweetID:String):Boolean 
		{
			if (_tweetVisited.indexOf(tweetID) == -1) return false;
			return true;
		}

		public function showTweetMessage(index:uint):void 
		{
			if (_currentIndex != index) {
				
				_currentIndex = index;
				
				detailIsOpen = true;
				currentData = getTweetData(index);
				
				var event:TwitterEvent = new TwitterEvent(TwitterEvent.SHOW_MESSAGE);
				event.index = index; 
				event.data = getTweetData(index);
				event.data.isVisited = isViewed(event.data.tweetID);
			
				addViewed(event.data.tweetID);
			
				dispatch(event);
			}
		}

		public function hideTweetMessage():void 
		{
			_currentIndex = -1;
				
			detailIsOpen = false;
			currentData = null;
				
			dispatch(new TwitterEvent(TwitterEvent.HIDE_MESSAGE));
		}
	}
}

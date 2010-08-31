package com.grupow.examples.twitter.services 
{
	import com.grupow.debug.Log;
	import com.grupow.examples.twitter.data.TweetData;
	import com.grupow.examples.twitter.events.TwitterServiceEvent;
	import com.swfjunkie.tweetr.Tweetr;
	import com.swfjunkie.tweetr.data.objects.SearchResultData;
	import com.swfjunkie.tweetr.events.TweetEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TwitterService extends Actor implements ITwitterService
	{
		private var service:Tweetr;

		public function TwitterService()
		{
			service = new Tweetr();
			setProxy(Config.TWEETR_PROXY_PATH);
			setCredentials("user", "pass");
		}		

		private function setProxy(proxyHost:String):void
		{
			Log.info(proxyHost);
			service.serviceHost = proxyHost;
		}

		private function setCredentials(username:String, password:String):void
		{
			service.username = username;
			service.password = password;
		}

		public function searchMessages(query:String, number:Number):void
		{
			service.search(query, null, number);
			service.addEventListener(TweetEvent.COMPLETE, handleSearchComplete);
		}

		private function handleSearchComplete(e:TweetEvent):void 
		{
			var messages:Array = new Array();
			var message:TweetData;
			var index:int = 0;
			for each (var update:SearchResultData in e.responseArray) {
				
				if (update.id == 0)
					continue;
					
				message = new TweetData();
				message.tweetID = String(update.id);				message.particleID = index++;
				message.userName = update.user;
				message.image = update.userProfileImage;
				message.date = update.createdAt;
				message.tweet = update.text;
				
				messages.push(message);
				
				Log.info("[TwitterMessageService].particleID {0} ", message.particleID);				Log.info("[TwitterMessageService].date {0} ", message.date);
				
			}
			
			var event:TwitterServiceEvent = new TwitterServiceEvent(TwitterServiceEvent.DATA_COMPLETE);
			event.messages = messages;
			dispatch(event);
		}
	}
}
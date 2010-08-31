package com.grupow.examples.twitter.views 
{
	import com.greensock.TweenLite;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.grupow.display.AbstractView;
	import com.grupow.display.BasicButton;
	import com.grupow.examples.twitter.data.TweetData;
	import com.grupow.examples.twitter.events.TwitterEvent;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TweetMessageView extends AbstractView 
	{

		public var data:TweetData;

		public function TweetMessageView() 
		{
			
		}
		
		//called in frame 2
		protected function updateCircle():void 
		{
			var display:MovieClip = getChildByName("circle_mc") as MovieClip;
			
			if (data.isVisited) {
				display.gotoAndStop("gray_twit");
			} else {
				if (data.particleID % 2) {
					display.gotoAndStop("red_twit");
				} else {
					display.gotoAndStop("green_twit");
				}
			}
		}
		
		//called in frame 2
		protected function setVisualData():void 
		{
			var name_txt:TextField = MovieClip(getChildByName("name_mc")).getChildByName("output_txt") as TextField;
			var date_txt:TextField = MovieClip(getChildByName("date_mc")).getChildByName("output_txt") as TextField;
			var tweet_txt:TextField = MovieClip(getChildByName("tweet_mc")).getChildByName("output_txt") as TextField;
			
			name_txt.text = data.userName;
			date_txt.text = data.date;
			tweet_txt.text = data.tweet;
			
			setFormat(name_txt);
			setFormat(date_txt);
			setFormat(tweet_txt);
		}
		
		//called in frame 7
		protected function addPhoto():void 
		{
			var photo:MovieClip = getChildByName("photo_mc") as MovieClip;
			var holder:MovieClip = photo.getChildByName("holder_mc") as MovieClip;
			
			var loader:ImageLoader = new ImageLoader(data.image, {onComplete:completeHandler, container:holder, autoDispose:true, smoothing:true, alpha:0, width:87, height:87, crop:true, scaleMode:"proportionalOutside" });
			loader.load();
		}

		override protected function opened_handler():void 
		{
			super.opened_handler();
			addEventListeners();
		}

		override protected function close_hook():void 
		{
			super.close_hook();
			removeEventListeners();
		}
		
		private function setFormat($textfield:TextField):void 
		{
			$textfield.gridFitType = GridFitType.SUBPIXEL;
			$textfield.antiAliasType = AntiAliasType.ADVANCED;
		}
		
		private function addEventListeners():void 
		{
			var profileBtn:BasicButton = getChildByName("profileBtn_mc") as BasicButton;
			var closeBtn:BasicButton = getChildByName("closeBtn_mc") as BasicButton;
			
			if(profileBtn != null) 
				profileBtn.addEventListener(MouseEvent.CLICK, profileHandler);
			
			if(closeBtn) 
				closeBtn.addEventListener(MouseEvent.CLICK, closeViewHandler);
		}

		private function removeEventListeners():void 
		{
			var profileBtn:BasicButton = getChildByName("profileBtn_mc") as BasicButton;
			var closeBtn:BasicButton = getChildByName("closeBtn_mc") as BasicButton;
			
			if(profileBtn != null) 
				profileBtn.removeEventListener(MouseEvent.CLICK, profileHandler);
				
			if(closeBtn != null) 
				closeBtn.removeEventListener(MouseEvent.CLICK, closeViewHandler);
		}

		private function profileHandler($event:MouseEvent):void 
		{
			var name:String = data.userName.substring(1, data.userName.length);
			var url:URLRequest = new URLRequest("http://twitter.com/" + name);
			navigateToURL(url, "_new");
		}

		private function closeViewHandler($event:MouseEvent):void 
		{
			var event:TwitterEvent = new TwitterEvent(TwitterEvent.HIDE_MESSAGE_REQUEST);
			event.data = data;
			dispatchEvent(event);
		}
		
		private function completeHandler(event:LoaderEvent):void 
		{
			TweenLite.to(ImageLoader(event.target).content, 0.5, {alpha:1});
		}

	}
}
package com.grupow.examples.twitter.views 
{
	import com.greensock.TweenLite;
	import com.grupow.examples.twitter.events.TwitterEvent;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class ParticleView extends MovieClip 
	{

		public static var COUNT:uint = 0;

		private var _index:uint;
		private var _isVisited:Boolean;
		private var display:MovieClip;

		public function ParticleView() 
		{
			display = getChildByName("circle_mc") as MovieClip;
			initialize();
			setIndex();
			updateCircle();
		}

		public function get isViewed():Boolean 
		{ 
			return _isVisited; 
		}

		public function set isViewed($value:Boolean):void 
		{ 
			_isVisited = $value; 
			
			if(_isVisited) 
				updateCircle(); 
		}

		public function get index():uint 
		{ 
			return _index; 
		}

		private function initialize():void 
		{
			_index = 0;
			_isVisited = false;
			this.buttonMode = true;
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler, false, 0, true);
		}

		private function setIndex():void 
		{
			_index = COUNT++ % 50;
		}

		private function mouseDownHandler($event:MouseEvent):void 
		{
			this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.buttonMode = false;
			this.mouseChildren = false;
			this.mouseEnabled = false;
			
			TweenLite.to(display, 0.5, { alpha:0 });
			
			var event:TwitterEvent = new TwitterEvent(TwitterEvent.SHOW_MESSAGE_REQUEST);
			event.index = _index;
			dispatchEvent(event);
		}

		private function updateCircle():void 
		{
			if (_isVisited) {
				display.gotoAndStop("gray_twit");
			} else {
				if (_index % 2) {
					display.gotoAndStop("red_twit");
				} else {
					display.gotoAndStop("green_twit");
				}
			}
		}
	}
}
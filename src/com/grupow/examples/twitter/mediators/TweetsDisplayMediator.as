package com.grupow.examples.twitter.mediators 
{
	import com.grupow.examples.twitter.events.TwitterEvent;
	import com.grupow.examples.twitter.views.TweetsDisplay;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TweetsDisplayMediator extends Mediator
	{

		[Inject]
		public var view:TweetsDisplay;

		public function TweetsDisplayMediator() 
		{
		}

		override public function onRegister():void 
		{
			eventMap.mapListener(eventDispatcher, TwitterEvent.SHOW_MESSAGE, handleShowMessage);
			eventMap.mapListener(eventDispatcher, TwitterEvent.HIDE_MESSAGE, handleHideMessage);
			
			eventMap.mapListener(eventDispatcher, TwitterEvent.SHOW_TWEETS, handleShowBubbles);
			eventMap.mapListener(eventDispatcher, TwitterEvent.HIDE_TWEETS, handleHideBubbles);
		}

		private function handleShowBubbles(e:TwitterEvent):void 
		{
			view.showTwitterBubbles();
		}

		private function handleHideBubbles(e:TwitterEvent):void 
		{
			view.hideTwitterBubbles();
		}

		private function handleHideMessage(e:TwitterEvent):void 
		{
			view.removeCircle();
		}

		private function handleShowMessage(e:TwitterEvent):void 
		{
			view.addCircle();
		}
	}
}
package com.grupow.examples.twitter.mediators 
{
	import com.grupow.events.ViewEvent;
	import com.grupow.examples.twitter.events.TwitterEvent;
	import com.grupow.examples.twitter.views.TweetMessageView;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TweetMessageViewMediator extends Mediator 
	{

		[Inject]
		public var view:TweetMessageView;

		public function TweetMessageViewMediator() 
		{
			
		}

		override public function onRegister():void 
		{
			eventMap.mapListener(eventDispatcher, TwitterEvent.SHOW_MESSAGE, showMessageHandler, TwitterEvent);
			eventMap.mapListener(eventDispatcher, TwitterEvent.HIDE_MESSAGE, hideMessageHandler, TwitterEvent);
			
			eventMap.mapListener(view, TwitterEvent.HIDE_MESSAGE_REQUEST, eventDispatcher.dispatchEvent, TwitterEvent);
		}

		private function showMessageHandler(event:TwitterEvent):void 
		{
			view.data = event.data;
			
			if (!view.getIsOpen()) {
				
				view.open();
				
			} else {
				
				view.addEventListener(ViewEvent.CLOSED, closedHandler);
				view.close();
			}
		}

		private function closedHandler(event:Event):void 
		{
			view.removeEventListener(ViewEvent.CLOSED, closedHandler);
			view.open();
		}

		private function hideMessageHandler($event:TwitterEvent):void 
		{
			view.close();
		}
	}
}
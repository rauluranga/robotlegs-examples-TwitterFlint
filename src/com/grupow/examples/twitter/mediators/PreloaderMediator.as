package com.grupow.examples.twitter.mediators 
{
	import com.grupow.examples.twitter.events.TwitterServiceEvent;
	import com.grupow.examples.twitter.views.PreloaderView;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class PreloaderMediator extends Mediator 
	{

		[Inject]
		public var view:PreloaderView;

		public function PreloaderMediator() 
		{
		}

		override public function onRegister():void 
		{
			eventMap.mapListener(eventDispatcher, ContextEvent.STARTUP_COMPLETE, openHandler);
			eventMap.mapListener(eventDispatcher, TwitterServiceEvent.DATA_COMPLETE, closeHandler);
		}

		private function openHandler($event:ContextEvent):void 
		{
			view.open();
		}

		private function closeHandler($event:TwitterServiceEvent):void 
		{
			view.close();
		}
	}
}
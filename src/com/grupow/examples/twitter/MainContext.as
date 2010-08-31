package com.grupow.examples.twitter 
{
	import com.grupow.examples.twitter.controllers.*;
	import com.grupow.examples.twitter.events.*;
	import com.grupow.examples.twitter.mediators.*;
	import com.grupow.examples.twitter.models.*;
	import com.grupow.examples.twitter.services.*;
	import com.grupow.examples.twitter.views.*;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class MainContext extends Context
	{

		public function MainContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}		

		override public function startup():void
		{
			injector.mapSingletonOf(ITwitterService, TwitterService);
			injector.mapSingleton(TweetsModel);
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, SearchTweetsCommand);			commandMap.mapEvent(TwitterServiceEvent.DATA_COMPLETE, UpdateTweetsCommand);
						commandMap.mapEvent(TwitterEvent.SHOW_MESSAGE_REQUEST, ShowMessageCommand);
			commandMap.mapEvent(TwitterEvent.HIDE_MESSAGE_REQUEST, HideMessageCommand);			
			
			mediatorMap.mapView(PreloaderView, PreloaderMediator);
			mediatorMap.mapView(TweetsDisplay, TweetsDisplayMediator);
			mediatorMap.mapView(TweetMessageView, TweetMessageViewMediator);
			mediatorMap.mapView(ParticleView, ParticleViewMediator);
			
			var preloader:PreloaderView = new PreloaderView();
			preloader.x = 320;			preloader.y = 180;
			
			var message:TweetMessageView = new TweetMessageView();
			message.x = 320;
			message.y = 180;			
			contextView.addChild(new TweetsDisplay());			contextView.addChild(preloader);			contextView.addChild(message);
			
			super.startup();
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
			
		}
	}
}
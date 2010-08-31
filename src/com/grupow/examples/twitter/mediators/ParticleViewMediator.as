package com.grupow.examples.twitter.mediators 
{
	import com.grupow.examples.twitter.events.TwitterEvent;
	import com.grupow.examples.twitter.models.TweetsModel;
	import com.grupow.examples.twitter.views.ParticleView;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class ParticleViewMediator extends Mediator 
	{

		[Inject]
		public var view:ParticleView;

		[Inject]
		public var model:TweetsModel;

		public function ParticleViewMediator() 
		{
		}

		override public function onRegister():void 
		{
			eventMap.mapListener(view, TwitterEvent.SHOW_MESSAGE_REQUEST, eventDispatcher.dispatchEvent);
			
			initParticle();
		}

		private function initParticle():void	
		{
			if (model.detailIsOpen) {
				if (view.index == model.currentData.particleID) {
					view.visible = false;
				}
			}
			
			view.isViewed = model.isViewed(model.getTweetData(view.index).tweetID);
		}
	}
}
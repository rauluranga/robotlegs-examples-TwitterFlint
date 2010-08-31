package com.grupow.examples.twitter.views 
{
	import com.grupow.examples.twitter.emitters.TweetsEmitter;

	import org.flintparticles.twoD.renderers.DisplayObjectRenderer;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TweetsDisplay extends MovieClip
	{
		private var emitter:TweetsEmitter;
		private var renderer:DisplayObjectRenderer;

		public function TweetsDisplay() 
		{
			//Create emitter
			emitter = new TweetsEmitter();
			
			//Create render
			renderer = new DisplayObjectRenderer();
			renderer.addEmitter(emitter);
			renderer.mouseChildren = true;
			//Render Scope
			addChild(renderer);
			
			this.addEventListener(Event.ENTER_FRAME, setMousePosition);
		}

		private function setMousePosition(e:Event):void 
		{
			emitter.setFrictionPosition(new Point(mouseX, mouseY));
		}

		public function addCircle():void 
		{
			emitter.enableCircles();
		}

		public function removeCircle():void 
		{
			emitter.disableCircles();
		}

		public function showTwitterBubbles():void 
		{
			emitter.start();
		}

		public function hideTwitterBubbles():void 
		{
			emitter.stop();
			emitter.killAllParticles();
		}
	}
}
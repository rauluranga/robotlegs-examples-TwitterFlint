package com.grupow.examples.twitter.emitters 
{
	import com.grupow.examples.twitter.views.ParticleView;

	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.energyEasing.Exponential;
	import org.flintparticles.common.initializers.CollisionRadiusInit;
	import org.flintparticles.common.initializers.ImageClass;
	import org.flintparticles.common.initializers.InitializerGroup;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.MassInit;
	import org.flintparticles.twoD.actions.Accelerate;
	import org.flintparticles.twoD.actions.BoundingBox;
	import org.flintparticles.twoD.actions.Collide;
	import org.flintparticles.twoD.actions.CollisionZone;
	import org.flintparticles.twoD.actions.DeathZone;
	import org.flintparticles.twoD.actions.Friction;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.RandomDrift;
	import org.flintparticles.twoD.actions.ZonedAction;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.ScaleAllInit;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.DiscSectorZone;
	import org.flintparticles.twoD.zones.DiscZone;
	import org.flintparticles.twoD.zones.LineZone;
	import org.flintparticles.twoD.zones.RectangleZone;

	import flash.geom.Point;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TweetsEmitter extends Emitter2D
	{
		private var friction:ZonedAction;
		private var circle1:CollisionZone;
		private var circle2:CollisionZone;

		public function TweetsEmitter() 
		{
			counter = new Steady(4);
					
			//Initialize particles group
			var particles:InitializerGroup = new InitializerGroup();
			particles.addInitializer(new CollisionRadiusInit(Config.PARTICLE_RADIOUS));
			particles.addInitializer(new Position(new LineZone(new Point(20, 405), new Point(600, 405))));
			particles.addInitializer(new MassInit(1));
			particles.addInitializer(new ImageClass(ParticleView));
			particles.addInitializer(new ScaleAllInit(0.1, 0.7));
			particles.addInitializer(new Lifetime(8, 15));
			particles.addInitializer(new Velocity(new DiscSectorZone(new Point(0, -50), 45, -45, 0, 0)));
			
			//Add particles group
			addInitializer(particles);
			
			//Add emmiter actions 
			addAction(new Move());
			addAction(new DeathZone(new RectangleZone(-40, -45, 680, 415), true));
			addAction(new BoundingBox(0, -80, 640, 440));
			addAction(new Collide(1));
			addAction(new RandomDrift(15, 15));
			addAction(new Age(Exponential.easeIn));  
			addAction(new Fade()); 
			addAction(new Accelerate(0, -30));
			
			friction = new ZonedAction(new Friction(15), new DiscZone(new Point(-100, -100), 50));
			addAction(friction);
			
			circle1 = new CollisionZone(new DiscZone(new Point(320, 180), 125, 0), 2);
			circle2 = new CollisionZone(new DiscZone(new Point(432, 264), 43, 0), 2);
		}

		public function setFrictionPosition(p:Point):void 
		{
			var _discZone:DiscZone = friction.zone as DiscZone;
			_discZone.center.x = p.x;
			_discZone.center.y = p.y;
		}

		public function disableCircles():void 
		{
			removeAction(circle1);
			removeAction(circle2);
		}

		public function enableCircles():void 
		{
			if (!hasAction(circle1)) 
				addAction(circle1);
				
			if (!hasAction(circle2)) 
				addAction(circle2);
		}
	}
}

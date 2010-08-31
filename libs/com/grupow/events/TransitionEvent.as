
/**
 * 
 * Grupow TransitionEvent
 * Copyright (c) 2009 ruranga@grupow.com
 * 
 * Released under MIT license:
 * http://www.opensource.org/licenses/mit-license.php
 * 
 **/

package com.grupow.events 
{
	import flash.events.Event;
	
	public class TransitionEvent extends Event
	{
		public static const COMPLETE:String = "complete";
				
		public function TransitionEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event 
		{
            return new TransitionEvent(type, bubbles, cancelable);
        }
	}
	
}
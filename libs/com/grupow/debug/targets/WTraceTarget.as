package com.grupow.debug.targets
{
	
	/**
	 * ...
	 * @author David Gamez
	 */
	public class WTraceTarget extends WLineFormattedTarget
	{
		public function WTraceTarget()
		{
			super();
		}

		override public function internalLog(message:String):void
		{
			trace(message);
		}
		
	}
	
}
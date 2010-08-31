package com.grupow.debug.errors
{
	
	/**
	 * ...
	 * @author David Gamez
	 */
	public class WInvalidFilterError extends Error
	{
		public function WInvalidFilterError(message:String)
		{
			super(message);
		}
		
		public function toString():String
		{
			return String(message);
		}
			
	}
	
}
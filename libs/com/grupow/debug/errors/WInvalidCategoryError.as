package com.grupow.debug.errors
{
	
	/**
	 * ...
	 * @author David Gamez
	 */
	public class WInvalidCategoryError extends Error
	{
		public function WInvalidCategoryError(message:String)
		{
			super(message);
		}
		
		public function toString():String
		{
			return String(message);
		}
			
	}
	
}
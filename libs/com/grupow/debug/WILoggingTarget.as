package com.grupow.debug
{
	
	/**
	 * ...
	 * @author David Gamez
	 */
	public interface WILoggingTarget 
	{
		function get filters():Array;
    
		function set filters(value:Array):void;
		
		function get level():int;
		
		function set level(value:int):void;
		
		function addLogger(logger:WILogger):void;
		
		function removeLogger(logger:WILogger):void; 
	}
	
}
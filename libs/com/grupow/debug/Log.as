﻿package com.grupow.debug 
{
	import com.grupow.debug.targets.WLineFormattedTarget;
	import com.grupow.debug.targets.WTraceTarget;
	
	/**
	 * ...
	 * @author Raúl Uranga
	 */
	public class Log 
	{
		private static const logger:WILogger = WLog.getLogger("default");
		
		public static var FIELD_SEPARATOR:String = " ";
		public static var INCLUDE_CATEGORY:Boolean = false;
		public static var INCLUDE_TIME:Boolean = false;
		public static var INCLUDE_LEVEL:Boolean = true;

		public static var verbose:Boolean = true;
		
		public function Log () {
			
		}
		
		static public function registerTarget(target:WLineFormattedTarget):void
		{
			target.fieldSeparator = Log.FIELD_SEPARATOR;
			target.includeCategory = Log.INCLUDE_CATEGORY;
			target.includeLevel = Log.INCLUDE_LEVEL;
			target.includeTime = Log.INCLUDE_TIME;
			target.addLogger(logger);			
		}
			
		static public function log(level:int, message:String, ...rest):void
		{
			var _params:Array = [level,message];
			_params = _params.concat(rest);
			
			if(verbose)
				logger.log.apply(null, _params);
				
		}
		
		static public function debug(message:String, ...rest):void
		{
			var _params:Array = [message];
			_params = _params.concat(rest);
			
			if(verbose)
				logger.debug.apply(null, _params);
		}
		
		static public function error(message:String, ...rest):void
		{
			var _params:Array = [message];
			_params = _params.concat(rest);
			
			if(verbose)
				logger.error.apply(null, _params);
		}
		
		static public function fatal(message:String, ...rest):void
		{
			var _params:Array = [message];
			_params = _params.concat(rest);
			
			if(verbose)
				logger.fatal.apply(null, _params);
		}
		
		static public function info(message:String, ...rest):void
		{
			var _params:Array = [message];
			_params = _params.concat(rest);
			
			if(verbose)
				logger.info.apply(null, _params);
		}
		
		static public function warn(message:String, ...rest):void
		{
			var _params:Array = [message];
			_params = _params.concat(rest);
			
			if(verbose)
				logger.warn.apply(null, _params);
		}
		
		
	}
	
}
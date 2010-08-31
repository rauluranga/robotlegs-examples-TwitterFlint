package com.grupow.debug
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author David Gamez
	 */
	public class WLogEvent extends Event 
	{
		public static const LOG:String = "log";
		
		public var message:String;
		public var level:int;
		
		
		public function WLogEvent(message:String = "", level:int = 0 /* WLogEventLevel.ALL */)
		{
			super(WLogEvent.LOG, false, false);

			this.message = message;
			this.level = level;
		}
			
		override public function clone():Event
		{
			return new WLogEvent(message, /*type,*/ level);
		}
		
	
		public static function getLevelString(value:uint):String
		{
			switch (value)
			{
				case WLogEventLevel.INFO:
				{
					return "INFO";
				}

				case WLogEventLevel.DEBUG:
				{
					return "DEBUG";
				}

				case WLogEventLevel.ERROR:
				{
					return "ERROR";
				}

				case WLogEventLevel.WARN:
				{
					return "WARN";
				}

				case WLogEventLevel.FATAL:
				{
					return "FATAL";
				}

				case WLogEventLevel.ALL:
				{
					return "ALL";
				}
			}

			return "UNKNOWN";
		}
	}
	
}
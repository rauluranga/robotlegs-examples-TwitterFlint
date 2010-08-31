package com.grupow.debug
{
	import com.grupow.debug.errors.WInvalidCategoryError;
	
	/**
	 * ...
	 * @author David Gamez
	 */
	public class WLog 
	{
		private static var NONE:int = int.MAX_VALUE;
		private static var _targetLevel:int = NONE;
		private static var _loggers:Array;
		private static var _targets:Array = [];
		
		public static function isFatal():Boolean
		{

			return (_targetLevel <= WLogEventLevel.FATAL) ? true : false;
		}
		
		public static function isError():Boolean
		{
			return (_targetLevel <= WLogEventLevel.ERROR) ? true : false;
		}
	
		public static function isWarn():Boolean
		{
			return (_targetLevel <= WLogEventLevel.WARN) ? true : false;
		}

		public static function isInfo():Boolean
		{
			return (_targetLevel <= WLogEventLevel.INFO) ? true : false;
		}
		
		public static function isDebug():Boolean
		{
			return (_targetLevel <= WLogEventLevel.DEBUG) ? true : false;
		}
		
		public static function addTarget(target:WILoggingTarget):void
		{
			if (target)
			{
				var filters:Array = target.filters;
				var logger:WILogger;
							
				for (var i:String in _loggers)
				{
					if (categoryMatchInFilterList(i, filters))
						target.addLogger(WILogger(_loggers[i]));
				}
				
				_targets.push(target);
				
				if (_targetLevel == NONE)
					_targetLevel = target.level
				else if (target.level < _targetLevel)
					_targetLevel = target.level;
			}
			else
			{
				var message:String = "logging" + " invalidTarget";
				throw new ArgumentError(message);
			}
		}
		
		public static function removeTarget(target:WILoggingTarget):void
		{
			if (target)
			{
				var filters:Array = target.filters;
				var logger:WILogger;
				
				for (var i:String in _loggers)
				{
					if (categoryMatchInFilterList(i, filters))
					{
						target.removeLogger(WILogger(_loggers[i]));
					}                
				}
				for (var j:int = 0; j<_targets.length; j++)
				{
					if (target == _targets[j])
					{
						_targets.splice(j, 1);
						j--;
					}
				}
				resetTargetLevel();
			}
			else
			{
				var message:String = "logging" + " invalidTarget";
				throw new ArgumentError(message);
			}
		}
		
		public static function getLogger(category:String):WILogger
		{
			checkCategory(category);
			if (!_loggers)
				_loggers = [];
				
				
			var result:WILogger = _loggers[category];
			
			//*/
			if (result == null)
			{
				result = new WLogLogger(category);
				_loggers[category] = result;
		

				var target:WILoggingTarget;
				
				for (var i:int = 0; i < _targets.length; i++)
				{
					target = WILoggingTarget(_targets[i]);
					if (categoryMatchInFilterList(category, target.filters))
						target.addLogger(result);
				}

			
			}
			//*/
			
			return result;
		}
		
		public static function flush():void
		{
			_loggers = [];
			_targets = [];
			_targetLevel = NONE;
		}
		
		public static function hasIllegalCharacters(value:String):Boolean
		{
			return value.search(/[\[\]\~\$\^\&\\(\)\{\}\+\?\/=`!@#%,:;'"<>\s]/) != -1;
		}
		
		private static function categoryMatchInFilterList(category:String, filters:Array):Boolean
		{
			var result:Boolean = false;
			var filter:String;
			var index:int = -1;
			for (var i:uint = 0; i < filters.length; i++)
			{
				filter = filters[i];
				
				index = filter.indexOf("*");

				if (index == 0)
					return true;

				index = index < 0 ? index = category.length : index -1;

				if (category.substring(0, index) == filter.substring(0, index))
					return true;
			}
			return false;
		}
		
		private static function checkCategory(category:String):void
		{
			var message:String;
			
			if (category == null || category.length == 0)
			{
				message = "logging" +  "invalidLen";
				throw new WInvalidCategoryError(message);
			}

			if (hasIllegalCharacters(category) || (category.indexOf("*") != -1))
			{
				message = "logging" + "invalidChars";
				throw new WInvalidCategoryError(message);
			}
		}
		
		private static function resetTargetLevel():void
		{
			var minLevel:int = NONE;
			for (var i:int = 0; i < _targets.length; i++)
			{
				if (minLevel == NONE || _targets[i].level < minLevel)
					minLevel = _targets[i].level;
			}
			_targetLevel = minLevel;
		}

			
	}
	
}
package com.grupow.examples.twitter.data 
{
	import com.grupow.examples.twitter.utils.DateFormatUtil;

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class TweetData 
	{
		public var tweetID:String;
		public var fullName:String;
		public var screenName:String;
		public var image:String;
		public var tweet:String;
		public var isVisited:Boolean;
		public var particleID:int;
		
		private var _userName:String;
		private var _date:String;
		private var _dateFormat:DateFormatUtil = new DateFormatUtil();

		public function TweetData() 
		{
		}

		public function get userName():String 
		{ 
			return "@" + _userName.substr(0, _userName.indexOf("(")); 
		}

		public function set userName($value:String):void 
		{ 
			_userName = $value; 
		}

		public function get date():String 
		{
			return _date;
		}

		public function set date($value:String):void 
		{ 
			_date = _dateFormat.getTime($value);
		}
	}
}
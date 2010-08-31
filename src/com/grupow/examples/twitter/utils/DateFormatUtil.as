package com.grupow.examples.twitter.utils 
{

	/**
	 * @author David Gamez
	 * @author Heidi Erika López Molina
	 * @author Raul Uranga
	 */
	public class DateFormatUtil 
	{

		private var _monthLabels:Array = new Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");

		public function DateFormatUtil()
		{
			
		}

		private function parseDate( str:String ):Date 
		{			var matches:Array = str.match(/(\d\d\d\d)-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)Z/);
			var d:Date = new Date(int(matches[1]), int(matches[2]) - 1, int(matches[3]), int(matches[4]), int(matches[5]), int(matches[6]));	
			return d;
		}

		
		public function getTime(value:String):String
		{
			var myDate:Date = parseDate(value);
			//trace(value);
			var localTime:String = getUSClockTime(myDate.getHours(), myDate.getMinutes());
			var currentMonth:String = myDate.getMonth().toString();
			var currentDay:uint = myDate.getDay();
			return localTime + " " + _monthLabels[currentMonth] + " " + doubleDigitFormat(currentDay);
		}

		private function getUSClockTime(hrs:uint, mins:uint):String 
		{
			var modifier:String = "PM";
			var minLabel:String = doubleDigitFormat(mins);
		
			if(hrs > 12) {
				hrs = hrs - 12;
			} else if(hrs == 0) {
				modifier = "AM";
				hrs = 12;
			} else if(hrs < 12) {
				modifier = "AM";
			}
		
			return (doubleDigitFormat(hrs) + ":" + minLabel + " " + modifier);
		}

		private function doubleDigitFormat(num:uint):String 
		{
			if(num < 10) {
				return ("0" + num);
			}
			return num.toString();			
		}
	}
}

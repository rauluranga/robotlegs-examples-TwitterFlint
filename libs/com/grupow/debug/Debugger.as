

/**
 * 
 * Grupow Debugger
 * Copyright (c) 2008 ruranga@grupow.com
 * 
 * Released under MIT license:
 * http://www.opensource.org/licenses/mit-license.php
 * 
 **/


package com.grupow.debug 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* 
	* @usage Shif + Click to active/deactive debug wiwndow
	* @example
	* import com.grupow.debug.Debugger;
	*
	* function click_handler(e:MouseEvent):void {
	* 	Debugger.output(Debugger.DEBUG,"test0","fdsd","sdfsdf");
	* }
	*
	* addChild(Debugger.getInstance());
	* 
	* stage.addEventListener(MouseEvent.CLICK, click_handler, false, 0, true);
	* 
	* @author Raúl Uranga
	* @version 0.01
	*/
	
	
	public class Debugger extends Sprite 
	{
		private static var _instance:Debugger;
		private var output_txt:TextField;
		
		public static const DEBUG:Number = 0;
		public static const INFO:Number = 1;
		public static const WARN:Number = 2;
		public static const ERROR:Number = 3;
		public static const FATAL:Number = 4;
		
		public function Debugger(isVisible = false) 
		{		
			this.visible = isVisible;
			addEventListener(Event.ADDED_TO_STAGE, added_handler, false, 0, true)	
		}
		
		private function added_handler(e:Event):void 
		{
			output_txt = new TextField();
			output_txt.selectable = true;
			output_txt.background = true;
			//output_txt.embedFonts = true;	
			output_txt.text = "Debugger v0.01";
			
			output_txt.setTextFormat(new TextFormat("Verdana",11,0,true));
			
			//this.alpha = 0.5
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.displayState = StageDisplayState.NORMAL;
			stage.addEventListener(MouseEvent.CLICK, click_handler, false, 0, true);
			stage.addEventListener(Event.RESIZE, resizeHandler);
	
			this.addChild(output_txt);
			
			parent.addEventListener(Event.ADDED, alwaysOnTop_handler, false, 0, true);
						
			resizeHandler();
				
		}
		
		private function alwaysOnTop_handler(e:Event):void 
		{
			//make always on top this clip!
			parent.addChild(this);
		}
		
		private function resizeHandler(e:Event = null):void
		{
			output_txt.width = this.stage.stageWidth;
			output_txt.height = 100;
			this.x = 0;
			this.y = this.stage.stageHeight - 100;
		}
		
		private function click_handler(e:MouseEvent):void 
		{
			if (e.shiftKey)
				this.visible = !this.visible;
		}
			
		public static function getInstance(isVisible:Boolean = false):Debugger
		{
			if (_instance == null) 
			{
				_instance = new Debugger(isVisible);
			}
			
			return _instance;
		}
			
		public static function output(logLel:Number = Debugger.INFO, ...rest):void
		{
			/*/
			if (_instance == null) {
				getInstance(false);
			}
			//*/
			
			var stackTrace:String = "";
			
			//trace("logLel: ", logLel);
			
			try {
				throw new Error();
			}catch (e:Error){
				stackTrace = e.getStackTrace(); 
			}
			
			var level:Array = ["[DEBUG]", "[INFO]", "[WARN]", "[ERROR]", "[FATAL]"];
			
			var output:String = level[logLel] +" "+ rest.toString().split(",").join(" ");
			if (logLel >= Debugger.WARN) {
				output += "\n" + stackTrace;
			}
			
			try {
				//if no instance created!
				_instance.output_txt.appendText("\n" + output);
				_instance.output_txt.scrollV = _instance.output_txt.maxScrollV;
				
			}catch (e:*) {
				
			}
			
			
			//_instance.output(logLel,rest);
		}
		
	}
	
}
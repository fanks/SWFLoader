package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.Security;
	import flash.system.SecurityDomain;
	import flash.text.TextField;
	
	[SWF(frameRate="60", backgroundColor="#000000", wmode="direct", allowFullscreenInteractive="true")]
	public class SWFLoader extends Sprite
	{
		private var loadingText:TextField = new TextField();
		
		public function SWFLoader()
		{
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			if(hasEventListener(Event.ADDED_TO_STAGE)){
				removeEventListener(Event.ADDED_TO_STAGE, init);
			}
			var mLoader:Loader = new Loader();
			var mRequest:URLRequest = new URLRequest("http://r.playerio.com/r/rymdenrunt-k9qmg7cvt0ylialudmldvg/Preload.swf?partnerId=notsocasual");
			
			var loaderContext : LoaderContext = new LoaderContext();
			loaderContext.checkPolicyFile = true;
			        
			loaderContext.securityDomain = SecurityDomain.currentDomain;            
			Security.allowDomain("*");
			mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			mLoader.load(mRequest, loaderContext);
		}
		
		private function onCompleteHandler(loadEvent:Event):void
		{
			addChild(loadEvent.currentTarget.content);
		}
	}
}
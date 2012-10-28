package lib.pieces
{
  import flash.display.Loader;
  import flash.display.MovieClip;
  import flash.display.Sprite;
  import flash.events.IOErrorEvent;
  import flash.events.ProgressEvent;
  import flash.events.Event;
  import flash.net.URLRequest;
  
  public class Ship extends Sprite
  {
    private var movie:MovieClip;
    private var loader:Loader;
    private var loaded:Boolean = false;
    private var loading:Boolean = false;
    
    public function Ship()
    {
    }
    
    public function loadSprite(url:URLRequest):Ship{
      
      if(!this.loading){
        this.loading = true;
        this.loaded = false;
        
        this.loader = new Loader();
        this.loader.loaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loadProgress);
        this.loader.loaderInfo.addEventListener(Event.COMPLETE, this.loadFinished);
        this.loader.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.loadError);
        
        this.loader.load(url);
      }else{
        throw new Error('Sprite is already loading'); 
      }
      
      return this;
    }
    
    private function loadProgress(event:ProgressEvent):void{
      var shipEvent:ShipEvent = new ShipEvent(ShipEvent.PROGRESS, true, true);
      shipEvent.setBytesLoaded(event.bytesLoaded);
      shipEvent.setBytesTotal(event.bytesTotal);
      
      this.dispatchEvent(shipEvent);
    }
    
    private function loadFinished(event:Event):void{
      var shipEvent:ShipEvent = new ShipEvent(ShipEvent.LOADED, true, true);
      this.loaded = true;
      this.loading = false;
      
      this.movie = this.loader.content as MovieClip;
      this.removeChild(this.movie);
      this.addChild(this.movie);
      
      this.dispatchEvent(shipEvent);
    }
    
    private function loadError(event:IOErrorEvent):void{
      this.loaded = false;
      this.loading = false;
      
      var shipEvent:ShipEvent = new ShipEvent(ShipEvent.LOAD_ERROR, true, true);
      shipEvent.setText(event.text);
      
      this.dispatchEvent(shipEvent);
    }
  }
  
}
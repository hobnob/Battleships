package lib.pieces
{
  import flash.events.Event;
  
  public class ShipEvent extends Event
  {
    public static const LOADED:String = 'loaded';
    public static const PROGRESS:String = 'progress';
    public static const LOAD_ERROR:String = 'load error';
    
    private var bytesTotal:int = 0;
    private var bytesLoaded:int = 0;
    
    private var text:String = '';
    private var code:int = 0;
    
    public function ShipEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false):void{
      super(type, bubbles, cancelable);
    }
    
    public function setBytesTotal(bytes:int):ShipEvent{
      this.bytesTotal = bytes;
      return this;
    }
    
    public function setBytesLoaded(bytes:int):ShipEvent{
      this.bytesLoaded = bytes;
      return this;
    }
    
    public function getBytesTotal():int{
      return this.bytesTotal;
    }
    
    public function getBytesLoaded():int{
      return this.bytesLoaded;
    }
    
    public function setCode(code:int):ShipEvent{
      this.code = code; 
      return this;
    }
    
    public function getCode():int{
      return this.code;
    }
    
    public function setText(text:String):ShipEvent{
      this.text = text;
      return this;
    }
    
    public function getText():String{
      return this.text;
    }

  }
}
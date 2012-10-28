package lib.grid
{
  import flash.events.Event;
  
  public class CellEvent extends Event
  {
    public static const ENTER_CELL:String = 'enter';
    public static const LEAVE_CELL:String = 'leave';
    
    public function CellEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false):void{
      super(type, bubbles, cancelable);
    }
  }
}
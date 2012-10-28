package lib.grid
{
  import flash.display.Sprite;
  import flash.events.MouseEvent;
  
  public class Cell extends Sprite{
    private var size:int = 10;
    
    public function Cell(){
      this.addEventListener(MouseEvent.MOUSE_OVER, this.triggerMouseOver);
      this.addEventListener(MouseEvent.MOUSE_OUT, this.triggerMouseOut);
    }
    
    public function setSize(size:int):Cell{
      this.size = size;
      
      this.graphics.beginFill(0xFF0000);
      this.graphics.lineStyle(1, 0x000000);
      this.graphics.drawRect(0, 0, size, size);
      this.graphics.endFill();
      
      return this;
    }
    
    private function triggerMouseOver(event:MouseEvent):void{
     var cellEvent:CellEvent = new CellEvent(CellEvent.ENTER_CELL, true, true);
     this.dispatchEvent(cellEvent);
    }
    
    private function triggerMouseOut(event:MouseEvent):void{
     var cellEvent:CellEvent = new CellEvent(CellEvent.LEAVE_CELL, true, true);
     this.dispatchEvent(cellEvent);
    }
    
  }
}
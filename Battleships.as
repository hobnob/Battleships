package {
  import flash.display.Sprite;
  import flash.net.URLRequest;
  import flash.text.TextField;
  
  import lib.grid.*;
  import lib.grid.collection.Row;
  import lib.pieces.Ship;

  public class Battleships extends Sprite{
    private var grid:Grid = new Grid();
    
    public function Battleships(){
      this.init();
      this.drawGrid();
      
      this.addEventListener(CellEvent.ENTER_CELL, this.checkGrid);
      this.addEventListener(CellEvent.LEAVE_CELL, this.checkGrid);
    }
    
    private function init():void{
      this.grid = new Grid();
      
      var gridSize:int = 10;
      
      for(var x:int = 0; x < gridSize; x++){
        var row:Row = new Row();
        
        for(var y:int = 0; y < gridSize; y++){          
          var cell:Cell = new Cell();
          row.addCell(cell);
        }
        
        this.grid.addRow(row);
      }
    }
    
    private function drawGrid():void{
      
      this.grid.setCellWidth(30);
      this.grid.setOffestX(30);
      this.grid.setOffestY(30);
      
      var cellSize:int = 30;
      var rows:Array = this.grid.getRows();
      
      for(var rowNum:int = 1; rowNum <= rows.length; rowNum ++){
        var row:Object = rows[rowNum - 1];
        
        var letter:TextField = new TextField;
        letter.text = rowNum.toString();
        letter.width = cellSize;
        letter.y = (rowNum * cellSize) + ((cellSize / 2) - (letter.textHeight / 2));
      
        letter.height = cellSize;
      
        this.addChild(letter);
        
        for(var colNum:int = 1; colNum <= row.getCells().length; colNum ++){
          
          if(rowNum === 1){
            for(var i:int = 1; i <= row.getCells().length; i++){
              var letter:TextField = new TextField;
              letter.text = String.fromCharCode(64 + i);
              letter.x = (i * cellSize) + ((cellSize / 2) - (letter.textWidth / 2));
              letter.y = 0;
              
              letter.height = cellSize;
              
              this.addChild(letter);
            }
          }
          
          this.addChild(row.getCells()[colNum - 1] as Cell);
        }
      }
      
      var ship:Ship = new Ship();
      ship.loadSprite(new URLRequest('assets/ship.jpg'));
      this.addChild(ship);
    }
    
    public function checkGrid(event:CellEvent):void{
      var cell:Cell = event.target as Cell;
      
      if(event.type == CellEvent.ENTER_CELL){
        cell.alpha = 0.65;
      }else if (event.type == CellEvent.LEAVE_CELL){
        cell.alpha = 1;
      }
    }
  }
}

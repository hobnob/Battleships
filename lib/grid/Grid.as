package lib.grid
{
  import lib.grid.collection.Column;
  import lib.grid.collection.Row;
  
  public class Grid
  {
    private var rows:Array = new Array();
    private var cols:Array = new Array();
    
    private var offsetx:int = 0;
    private var offsety:int = 0;
    private var cellWidth:int = 10;
    
    public function Grid(){}
    
    public function setOffestX(offset:int):Grid{
      this.offsetx = offset;
      return this;
    }
    
    public function setOffestY(offset:int):Grid{
      this.offsety = offset;
      return this;
    }
    
    public function setCellWidth(width:int):Grid{
      this.cellWidth = width;
      return this;
    }
        
    public function addRow(row:Row):Grid{
      this.rows.push(row);
      
      var i:int = 0;
      for each (var cell:Cell in row.getCells()){
        if(i > cols.length - 1){
          cols.push(new Column());
        }

        cols[i].addCell(cell);
        i++;
      }
      return this;
    }
    
    public function getRows():Array{
      
      for(var rowNum:int = 0; rowNum < this.rows.length; rowNum ++){
        for(var colNum:int = 0; colNum < this.rows[rowNum].getCells().length; colNum ++){
          this.rows[rowNum].getCells()[colNum].setSize(this.cellWidth);
          this.rows[rowNum].getCells()[colNum].x = (rowNum * this.cellWidth) + this.offsetx;
          this.rows[rowNum].getCells()[colNum].y = (colNum * this.cellWidth) + this.offsety;
        }
      }
      return this.rows;
    }
  }
}
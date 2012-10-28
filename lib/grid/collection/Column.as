package lib.grid.collection
{
  import lib.grid.Cell;
  public class Column
  {
    private var cells:Array = new Array();
    
    
    public function Column()
    {
    }
    
    public function addCell(cell:Cell):Column{
      this.cells.push(cell);
      return this;
    }
    
    public function getCells():Array{
      return this.cells;
    }

  }
}
package lib.grid.collection
{
  import lib.grid.Cell;
  public class Row
  {
    private var cells:Array = new Array();
    
    public function Row()
    {
      //TODO: implement function
    }
    
    public function addCell(cell:Cell):Row{
      this.cells.push(cell);
      return this;
    }
    
    public function getCells():Array{
      return this.cells;
    }

  }
}
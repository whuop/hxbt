package nodes;
import luxe.Entity;
import luxe.Vector;

class BaseNode extends Entity
{
	public function new(name : String) 
	{
		super( { name : name } );
	}
	
	public function pointInside(p : Vector) : Bool
	{
		return false;
	}
}
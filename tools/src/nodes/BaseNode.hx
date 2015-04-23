package nodes;
import luxe.Entity;
import luxe.Vector;

class BaseNode extends Entity
{
	public function new(name : String) 
	{
		super( { name : name } );
		
		NodeManager.Add(this);
	}
	
	override function destroy(?_fromparent : Null<Bool>) : Void
	{
		NodeManager.Remove(this);
		super.destroy(true);
	}
	
	public function pointInside(p : Vector) : Bool
	{
		return false;
	}
}
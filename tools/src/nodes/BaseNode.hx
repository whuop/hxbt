package nodes;

import luxe.Entity;
import luxe.Vector;

class BaseNode extends Entity
{
	public function new(name : String) 
	{
		super( { name : name } );
		
		cast(Luxe.scene.entities.get(Names.NODE_MANAGER), NodeManager).addNode(this);
	}
	
	override function ondestroy() : Void
	{
		var nodeManager = Luxe.scene.entities.get(Names.NODE_MANAGER);
		
		if (nodeManager != null)
			cast(nodeManager, NodeManager).removeNode(this);
	}
	
	public function pointInside(p : Vector) : Bool
	{
		return false;
	}
}
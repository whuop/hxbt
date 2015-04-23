package nodes;

import luxe.Transform;
import luxe.Vector;

class BaseNode
{
	public function new() 
	{
		//cast(Luxe.scene.entities.get(Names.NODE_MANAGER), NodeManager).addNode(this);
	}
	
	public function destroy() : Void
	{
		//var nodeManager = Luxe.scene.entities.get(Names.NODE_MANAGER);
		
		//if (nodeManager != null)
			//cast(nodeManager, NodeManager).removeNode(this);
	}
	
	public function pointInside(p : Vector) : Bool
	{
		return false;
	}
	
	public function setPos( v : Vector ) : Void
	{
		
	}
	
	public function getPos() : Vector
	{
		return null;
	}
}
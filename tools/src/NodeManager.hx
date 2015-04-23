package;

import luxe.Entity;
import luxe.Input.MouseEvent;
import nodes.BaseNode;
class NodeManager extends Entity
{
	private static var m_instance : NodeManager;
	
	private var m_nodes : Array<BaseNode>;
	
	public function new() 
	{
		m_nodes = new Array<BaseNode>();
		
		super( { name : Names.NODE_MANAGER } );
	}
	
	public function addNode(n : BaseNode) : Void
	{
		m_nodes.push(n);
	}
	
	public function removeNode(n : BaseNode) : Void
	{
		m_nodes.remove(n);
	}
	
	override function update(dt : Float) : Void
	{
		
	}
	
	override function onmousemove(e : MouseEvent) : Void
	{
		
	}
	
	override function onmousedown(e : MouseEvent) : Void
	{
		
	}
	
	override function onmouseup(e : MouseEvent) : Void
	{
		
	}
}
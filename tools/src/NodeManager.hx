package;

import luxe.Entity;
import luxe.Input.MouseEvent;
import nodes.BaseNode;
class NodeManager extends Entity
{
	private static var m_instance : NodeManager;
	
	private var m_nodes : Array<BaseNode>;
	
	private var m_draggedNode : BaseNode;
	private var m_hoveredNode : BaseNode;
	
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
		if (m_draggedNode != null)
		{
			m_draggedNode.pos = Luxe.screen.cursor.pos.clone();
		}
	}
	
	override function onmousemove(e : MouseEvent) : Void
	{
		var hoveredNode = null;
		for (node in m_nodes)
		{
			if (node.pointInside(e.pos))
			{
				if (node != m_hoveredNode)
				{
					node.events.fire(Evts.NODE_ON_ENTER);
					
					if (m_hoveredNode != null)
						m_hoveredNode.events.fire(Evts.NODE_ON_EXIT);
					m_hoveredNode = node;
				}
				break;
			}
		}
	}
	
	override function onmousedown(e : MouseEvent) : Void
	{
		if (m_hoveredNode != null)
		{
			m_draggedNode = m_hoveredNode;
		}
	}
	
	override function onmouseup(e : MouseEvent) : Void
	{
		m_draggedNode = null;
	}
}
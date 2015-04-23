package nodes;
import luxe.Vector;

/**
 * ...
 * @author Kristian Brodal
 */
class NodeDecorator extends BaseNode
{
	private var m_decorated : BaseNode;
	
	public function new(decorated : BaseNode) 
	{
		this.m_decorated = decorated;
		super();
	}
	
	override function destroy() : Void
	{
		m_decorated.destroy();
	}
	
	override function pointInside(p : Vector) : Bool
	{
		return false;
	}
	
	override function setPos(v : Vector) : Void
	{
		m_decorated.setPos(v);
	}
	
	override function getPos() : Vector
	{
		return m_decorated.getPos();
	}
}
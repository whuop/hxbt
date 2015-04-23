package nodes;
import luxe.Vector;
import phoenix.geometry.QuadGeometry;
import luxe.Color;

/**
 * ...
 * @author Kristian Brodal
 */
class BoxNodeDecorator extends NodeDecorator
{
	
	public var box(default, default) : QuadGeometry;
	
	private var m_width : Int;
	private var m_height : Int;
	
	public function new(decorated : BaseNode) 
	{
		super(decorated);
		box = Luxe.draw.box( {
			x : 0,
			y : 0,
			w : 70,
			h : 50,
			color : new Color(63/255, 91/255, 127/255, 1)
		});
		m_width = 70;
		m_height = 30;
	}
	
	override function destroy() : Void
	{
		m_decorated.destroy();
		super.destroy();
	}
	
	override function pointInside(p : Vector) : Bool
	{
		if (super.pointInside(p))
		{
			return true;
		}
		
		if (p.x >= box.transform.pos.x && p.x <= box.transform.pos.x + m_width &&
			p.y >= box.transform.pos.y && p.y <= box.transform.pos.y + m_height)
		{
			return true;
		}
		
		return false;
	}
	
	override function setPos(v : Vector) : Void
	{
		m_decorated.setPos(v);
		box.transform.pos = v.clone();
	}
	
	override function getPos() : Vector
	{
		return box.transform.pos;
	}
}
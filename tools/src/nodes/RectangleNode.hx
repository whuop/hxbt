package nodes;
import luxe.Vector;
import luxe.Color;
import phoenix.geometry.QuadGeometry;

class RectangleNode extends BaseNode
{
	public var box(default, default) : QuadGeometry;
	
	private var m_width : Int;
	private var m_height : Int;
	
	public function new(_name : String, _width : Int, _height : Int, _color : Color) 
	{
		super( name );
		box = Luxe.draw.box( {
			x : 0,
			y : 0,
			w : _width,
			h : _height,
			color : _color
		});
		box.transform.parent = this.transform;
		m_width = _width;
		m_height = _height;
	}
	
	override function update(dt : Float) : Void
	{
		super.update(dt);
	}
	
	override function pointInside(p : Vector) : Bool
	{
		if (p.x >= this.pos.x && p.x <= this.pos.x + m_width &&
			p.y >= this.pos.y && p.y <= this.pos.y + m_height)
		{
			return true;
		}
		
		return false;
	}
}
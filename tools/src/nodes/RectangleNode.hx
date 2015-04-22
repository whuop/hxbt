package nodes;
import luxe.Color;
import phoenix.geometry.QuadGeometry;

class RectangleNode extends BaseNode
{

	public var box(default, default) : QuadGeometry;
	
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
	}
	
	override function update(dt : Float) : Void
	{
		super.update(dt);
	}
}
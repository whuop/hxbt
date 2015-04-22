package nodes;
import luxe.Color;

class RectangleNode extends BaseNode
{
	public var x(default, default) : Int;
	public var y(default, default) : Int;
	public var width(default, default) : Int;
	public var height(default, default) : Int;
	public var color(default, default) : Color;
	
	public function new(_name : String, _x : Int, _y : Int, _width : Int, _height : Int, _color : Color) 
	{
		super( name );
		this.x = _x;
		this.y = _y;
		this.width = _width;
		this.height = _height;
		this.color = _color;
	}
	
	override function update(dt : Float) : Void
	{
		Luxe.draw.rectangle( {
			x : this.x,
			y : this.y,
			w : this.width,
			h : this.height,
			color : this.color,
			immediate : true
		});
		
		super.update(dt);
	}
}
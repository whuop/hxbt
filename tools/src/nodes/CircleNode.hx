package nodes;
import luxe.Color;

class CircleNode extends BaseNode
{
	public var x(default, default) : Int;
	public var y(default, default) : Int;
	public var r(default, default) : Int;
	public var color(default, default) : Color;
	
	public function new(_name : String, _x : Int, _y : Int, _r : Int, _color : Color) 
	{
		super( name );
		this.x = _x;
		this.y = _y;
		this.r = _r;
		this.color = _color;
	}
	
	override function update(dt : Float) : Void
	{
		Luxe.draw.ring({
            x : this.x,
            y : this.y,
            r : this.r,
            color : this.color,
			immediate : true
        });
		
		super.update(dt);
	}
}
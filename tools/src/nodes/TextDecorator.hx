package nodes;
import luxe.Text;
import luxe.Vector;

class TextDecorator extends NodeDecorator
{
	public var text(default, default) : Text;
	
	public function new(decorated : BaseNode) 
	{
		super(decorated);
		
		this.text = new Text( {
			name : 'text_decorator',
			name_unique : true,
			text : 'Hello'
		} );
	}
	
	override function destroy() : Void
	{
		m_decorated.destroy();
		super.destroy();
	}
	
	override function pointInside(p : Vector) : Bool
	{
		return m_decorated.pointInside(p);
	}
	
	override function setPos(v : Vector) : Void
	{
		text.pos = v.clone();
		super.setPos(v);
	}
	
	override function getPos() : Vector
	{
		if (m_decorated.getPos() == null)
			return this.text.pos;
		
		return m_decorated.getPos();
	}
}
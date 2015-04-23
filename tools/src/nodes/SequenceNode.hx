package nodes;
import luxe.Color;
import luxe.Rectangle;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;

/**
 * ...
 * @author Kristian Brodal
 */
class SequenceNode extends RectangleNode
{
	private static var NORMAL_COLOR = new Color(63 / 255, 91 / 255, 127 / 255, 0.7);
	
	private var m_icon : Sprite;
	
	public function new(name : String, x : Int, y : Int) 
	{
		super(name, 84, 84, NORMAL_COLOR);
		
		Luxe.loadTexture('assets/icons.png', function(texture : Texture)
		{
			m_icon = new Sprite( {
				name : 'icon',
				name_unique : true,
				texture : texture,
				uv : new Rectangle(0, 0, 64, 64),
				size : new Vector(64, 64),
				origin : new Vector(32, 32),
				pos : new Vector( 84 / 2, 84 / 2)
			} );
			m_icon.transform.parent = this.transform;
		});
		
		this.pos = new Vector(x, y);
		
		Logger.Log('/ Create / Sequence Node');
	}
	
}
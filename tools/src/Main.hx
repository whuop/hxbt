package;

import luxe.Color;
import luxe.Input;
import nodes.CircleNode;
import nodes.RectangleNode;

class Main extends luxe.Game 
{
	
	var node : RectangleNode;
	var cnode : CircleNode;
	
	override function ready() 
	{
		Core.Initialize();
		node = new RectangleNode('rectNode', 100, 100, 100, 50, new Color(0, 1, 0, 1));
		cnode = new CircleNode('cnode', 220, 100, 50, new Color(1, 0, 0, 1));
	}

	override function onkeyup(e:KeyEvent) 
	{
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}

	override function update(dt:Float) 
	{
	}
}

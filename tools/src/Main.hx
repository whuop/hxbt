package;

import luxe.Color;
import luxe.Input;
import nodes.CircleNode;
import nodes.RectangleNode;
import nodes.SequenceNode;

class Main extends luxe.Game 
{
	
	var node : RectangleNode;
	var cnode : CircleNode;
	var snode : SequenceNode;
	
	override function ready() 
	{
		Core.Initialize();
		//node = new RectangleNode('rectNode', 100, 100, 100, 50, new Color(63/255, 91/255, 127/255, 1));
		cnode = new CircleNode('cnode', 220, 100, 50, new Color(63, 0, 0, 1));
		snode = new SequenceNode('sequence', 100, 100);
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

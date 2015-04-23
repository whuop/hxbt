package;

import luxe.Vector;
import luxe.Color;
import luxe.Input;
import nodes.BaseNode;
import nodes.BoxNodeDecorator;
import nodes.TextDecorator;

class Main extends luxe.Game 
{
	
	var node : BaseNode;
	
	override function ready() 
	{
		Core.Initialize();
		//node = new RectangleNode('rectNode', 100, 100, 100, 50, new Color(63/255, 91/255, 127/255, 1));
		//cnode = new CircleNode('cnode', 220, 100, 50, new Color(63, 0, 0, 1));
		//snode = new SequenceNode('sequence', 100, 100);
		
		node = new TextDecorator( new BoxNodeDecorator(new BaseNode()) );
		node.setPos(new Vector(100, 100));
		
		Core.nodeManager.addNode(node);
	}

	override function onkeyup(e:KeyEvent) 
	{
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}

	override function update(dt:Float) 
	{
	}
	
	override function onmousemove(e : MouseEvent)
	{
		
	}
	
	override function onmousedown(e : MouseEvent)
	{
		
	}
	
	override function onmouseup(e : MouseEvent)
	{
		
	}
}

package;

import luxe.Input;
import tests.SelectorTest;

class Main extends luxe.Game 
{
	override function ready() 
	{
		//new BehaviorTest();
		//new SequenceTest();
		new SelectorTest();
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

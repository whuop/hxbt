package;

import luxe.Input;

class Main extends luxe.Game 
{
	override function ready() 
	{
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

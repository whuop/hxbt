package;

#if !behaviour
import luxe.Input;
import tests.BehaviorTreeTest;

class Main extends luxe.Game 
{
	var behaviorTreeTest : BehaviorTreeTest;
	
	override function ready() 
	{
		//new BehaviorTest();
		//new SequenceTest();
		//new SelectorTest();
		behaviorTreeTest = new BehaviorTreeTest();
	}

	override function onkeyup(e:KeyEvent) 
	{
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}

	override function update(dt:Float) 
	{
		behaviorTreeTest.update(dt);
	}
}
#end

package;

import hxbt.composites.Selector;
import luxe.Input;

import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.composites.Sequence;

class Blackboard
{
	public var name : String;
	
	public function new(_name) : Void
	{
		this.name = _name;
	}
}

class SimpleBehavior extends Behavior<Blackboard>
{
	public function new() : Void
	{
		super();
	}
	
	override function update( context : Blackboard, dt : Float) : Status 
	{ 
		trace('Updating ${context.name}');
		return Status.SUCCESS; 
	}
	
	
	override function onInitialize( context : Blackboard) : Void 
	{ 
		trace('Initializing ${context.name}');
	}
	
	override function onTerminate(context : Blackboard, status : Status) : Void 
	{ 
		trace('Terminating ${context.name}');
	}
}

class Main extends luxe.Game 
{
	var behaviorTree:BehaviorTree<Blackboard>;

	override function ready() 
	{
		behaviorTree = new BehaviorTree<Blackboard>();
		behaviorTree.period = 1.0 / 60.0; //	Make it update roughly every frame.
		
		behaviorTree.setContext(new Blackboard('SimpleBehavior'));
		
		var root = new Selector<Blackboard>();
		var sequence = new Sequence<Blackboard>();
		sequence.add(new SimpleBehavior());
		root.add(sequence);
		
		behaviorTree.setRoot(root);
	}

	override function onkeyup(e:KeyEvent) 
	{
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}

	override function update(dt:Float) 
	{
		if(behaviorTree != null) {
			behaviorTree.update(dt);
		}
	}
}
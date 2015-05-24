package;

import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.composites.Sequence;
import hxbt.composites.Selector;

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

class Main
{
	

	static function main() 
	{
		//	Create the behavior tree
		var behaviorTree = new BehaviorTree<Blackboard>();
		//	Make it update roughly every frame.
		var dt = 1.0 / 60.0;
		behaviorTree.period = dt; 
		//	Set which blackboard it should use.
		behaviorTree.setContext(new Blackboard('SimpleBehavior'));
		
		//	Root element of the tree, is usually a selector.
		var root = new Selector<Blackboard>();
		behaviorTree.setRoot(root);
		//	After that, add a sequence that goes through a number of behaviors
		var sequence = new Sequence<Blackboard>();
		root.add(sequence);
		//	And lastly, add behaviors to that sequence
		sequence.add(new SimpleBehavior());
		
		
		//	Run the behavior tree 100 times just to test it.
		var i = 0;
		while (i < 100)
		{
			behaviorTree.update(dt);
			i++;
		}
	}
}
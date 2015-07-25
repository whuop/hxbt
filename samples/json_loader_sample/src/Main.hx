import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.composites.Sequence;
import hxbt.composites.Selector;
import hxbt.loaders.BehaviorTreeJSONLoader;
import hxbt.Behavior;

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
		//	Construct the json string that defines the behavior tree.
		var json = '
		{
			"test_tree" : 
			{
				"hxbt.selector" : 
				{
					"hxbt.sequence": 
					[
						{"SimpleBehavior" : {}}
					]
				}
			}
		}
		';
		
		var behaviorTree : BehaviorTree<Blackboard> = BehaviorTreeJSONLoader.FromJSONString(json, "test_tree");
		var dt = 1.0 / 60.0;
		behaviorTree.period = dt; 
		//	Set which blackboard it should use.
		behaviorTree.setContext(new Blackboard('SimpleBehavior'));

		//	Run the behavior tree 100 times just to test it.
		var i = 0;
		while (i < 100)
		{
			behaviorTree.update(dt);
			i++;
		}
	}
}
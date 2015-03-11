package tests;
import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.Sequence;

/**
 * ...
 * @author Kristian Brodal
 */
class BehaviorTreeTest
{
	private var m_tree : BehaviorTree;
	
	public function new() 
	{
		m_tree = new BehaviorTree();
		
		var sequence = new Sequence();
		sequence.add(new TestBehavior("0", Status.SUCCESS));
		sequence.add(new TestBehavior("1", Status.SUCCESS));
		sequence.add(new TestBehavior("2", Status.SUCCESS));
		
		m_tree.setTree(sequence);
		
		
	}

	public function update(dt : Float) : Void
	{
		m_tree.update(dt);
	}
}

class TestBehavior extends Behavior
{
	public var m_name : String;
	public var m_return : Status;
	
	public function new(name : String, returnStatus : Status)
	{
		super();
		
		m_name = name;
		m_return = returnStatus;
	}
	
	override function onInitialize() : Void
	{
		trace('Initialized ${m_name}');
	}
	
	override function onTerminate(status : Status) : Void
	{
		trace('Terminated ${m_name}');
	}
	
	override function update() : Status
	{
		trace('Updated ${m_name}');
		return m_return;
	}
}
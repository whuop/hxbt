package tests;
import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.Sequence;

/**
 * ...
 * @author Kristian Brodal
 */

 typedef TreeContext = 
 {
	integer : Int,
	float : Float,
	string : String
 }
 
class BehaviorTreeTest
{
	private var m_tree : BehaviorTree<TreeContext>;
	
	public function new() 
	{
		m_tree = new BehaviorTree<TreeContext>();
		
		var sequence = new Sequence();
		sequence.add(new TestBehavior("0", Status.SUCCESS));
		sequence.add(new TestBehavior("1", Status.SUCCESS));
		sequence.add(new TestBehavior("2", Status.SUCCESS));
		
		m_tree.set(sequence, { integer : 3, float : 12.3, string : 'TestString' } );
		
		
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
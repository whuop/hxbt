package tests;
import hxbt.Behavior;
import hxbt.Sequence;

/**
 * ...
 * @author Kristian Brodal
 */
class SequenceTest
{

	public function new() 
	{
		var s = new Sequence();
		s.add(new TestBehavior("0"));
		s.add(new TestBehavior("1"));
		s.add(new TestBehavior("2"));
		
		s.tick();
	}
	
}

class TestBehavior extends Behavior
{
	public var m_name : String;
	
	public function new(name : String)
	{
		super();
		
		m_name = name;
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
		return Status.SUCCESS;
	}
}
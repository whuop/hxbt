package tests;
import hxbt.Behavior;
import hxbt.composites.Sequence;

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
		
		trace('/----------- SEQUENCE TEST -----------/');
		s.tick(null);
		trace('/--------- END SEQUENCE TEST ---------/');
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
	
	override function onInitialize(context : Dynamic) : Void
	{
		trace('Initialized ${m_name}');
	}
	
	override function onTerminate(context : Dynamic, status : Status) : Void
	{
		trace('Terminated ${m_name}');
	}
	
	override function update(context : Dynamic) : Status
	{
		trace('Updated ${m_name}');
		return Status.SUCCESS;
	}
}
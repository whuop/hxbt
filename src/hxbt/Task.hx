package hxbt;
import hxbt.Behavior.Status;

/**
 * ...
 * @author Kristian Brodal
 */
class Task
{
	private var m_owner : Node;
	
	public function new(node : Node) 
	{
		m_owner = node;
	}
	
	public function update() : Status
	{
		return Status.INVALID;
	}
	
	public function onInitialize() : Void { }
	public function onTerminate(status : Status) {}
	
}
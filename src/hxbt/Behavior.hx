package hxbt;
import hxbt.Behavior.Status;

/*
 * Behavior states.
 */
enum Status 
{
	INVALID;
	SUCCESS;
	FAILURE;
	RUNNING;
}

/**
 * Base class for all actions, conditons and composites.
 * A composite is a branch in the behavior tree.
 * @author Kristian Brodal
 */
class Behavior
{
	
	public var status(default, default) : Status = Status.INVALID;
	private var m_node : Node;
	private var m_task : Task;
	
	public function new(?node : Node) 
	{
		if (node != null)
		{
			setup(node);
		}
	}
	
	public function setup(node : Node) : Void
	{
		teardown();
		
		m_node = node;
		m_task = node.create();
	}
	
	public function teardown() : Void
	{
		if (m_task == null)
			return;
			
		m_node.destroy(m_task);
		m_task = null;
	}
	
	public function update() : Status { return Status.INVALID; }
	public function onInitialize() : Void { }
	public function onTerminate(status : Status) : Void { }
	
	public function tick() : Status 
	{
		if (status == Status.INVALID)
		{
			m_task.onInitialize();
		}
		
		status = m_task.update();
		
		if (status != Status.RUNNING)
		{
			m_task.onTerminate(status);
		}
		
		return status;
	}
	
	
	public function get() : Task 
	{
		return m_task;
	}
}
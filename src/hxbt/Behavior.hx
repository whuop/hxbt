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
	
	public function new() 
	{
		
	}
	
	public function update() : Status { return Status.INVALID; }
	public function onInitialize() : Void { }
	public function onTerminate(status : Status) : Void { }
	
	public function tick() : Status 
	{
		if (status == Status.INVALID)
		{
			onInitialize();
		}
		
		status = update();
		
		if (status != Status.RUNNING)
		{
			onTerminate(status);
		}
		
		return status;
	}
	
}
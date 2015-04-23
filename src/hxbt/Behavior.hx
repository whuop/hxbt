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
 @:keepSub
class Behavior
{
	
	public var status(default, default) : Status = Status.INVALID;
	
	public function new() 
	{
		
	}
	
	public function update( context : Dynamic, dt : Float) : Status { return Status.INVALID; }
	public function onInitialize( context : Dynamic) : Void { }
	public function onTerminate(context : Dynamic, status : Status) : Void { }
	
	public function tick(context : Dynamic, dt : Float) : Status 
	{
		if (status == Status.INVALID)
		{
			onInitialize(context);
		}
		
		status = update(context, dt);
		
		if (status != Status.RUNNING)
		{
			onTerminate(context, status);
		}
		
		return status;
	}
	
}
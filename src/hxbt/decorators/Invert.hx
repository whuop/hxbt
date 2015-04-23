package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.Decorator;

/**
 * Will always succeed no matter whether the child succeeds or fails
 * @author Kenton Hamaluik
 */
class Invert extends Decorator
{
	public function new(?child : Behavior) 
	{
		super(child);
	}
	
	override function update(context : Dynamic, dt : Float) : Status
	{
		if(m_child == null)
		{
			throw "Inverter requires child to not be null!";
		}

		var childResult : Status = m_child.tick(context, dt);
		if(childResult == Status.SUCCESS)
		{
			return Status.FAILURE;
		}
		else if(childResult == Status.FAILURE)
		{
			return Status.SUCCESS;
		}
		return childResult;
	}
}
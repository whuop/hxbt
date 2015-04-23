package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.Decorator;

/**
 * will repeat the child until it succeeds
 * @author Kenton Hamaluik
 */
class UntilSuccess extends Decorator
{
	public function new(?child : Behavior) 
	{
		super(child);
	}
	
	override function update(context : Dynamic, dt : Float) : Status
	{
		var childResult : Status = m_child.tick(context, dt);
		if(childResult != Status.SUCCESS)
		{
			return Status.RUNNING;
		}

		return Status.SUCCESS;
	}
}
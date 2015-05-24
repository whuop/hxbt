package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.Decorator;

/**
 * will repeat the child until it fails
 * @author Kenton Hamaluik
 */
class UntilFail<T> extends Decorator<T>
{
	public function new(?child : Behavior<T>) 
	{
		super(child);
	}
	
	override function update(context : T, dt : Float) : Status
	{
		var childResult : Status = m_child.tick(context, dt);
		if(childResult != Status.FAILURE)
		{
			return Status.RUNNING;
		}

		return Status.SUCCESS;
	}
}
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
		var childResult : Status = m_child.update(context, dt);
		if(childResult == Status.SUCCESS) {
			return Status.FAILURE;
		}
		else if(childResult == Status.FAILURE) {
			return Status.SUCCESS;
		}
		return childResult;
	}
}
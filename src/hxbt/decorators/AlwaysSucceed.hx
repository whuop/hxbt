package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.Decorator;

/**
 * Will always succeed no matter whether the child succeeds or fails
 * @author Kenton Hamaluik
 */
class AlwaysSucceed<T> extends Decorator<T>
{
	public function new(?child : Behavior<T>) 
	{
		super(child);
	}
	
	override function update(context : T, dt : Float) : Status
	{
		return Status.SUCCESS;
	}
}
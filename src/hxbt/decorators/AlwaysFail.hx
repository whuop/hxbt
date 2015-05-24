package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.Decorator;

/**
 * Will always fail no matter whether the child succeeds or fails
 * @author Kenton Hamaluik
 */
class AlwaysFail<T> extends Decorator<T>
{
	public function new(?child : Behavior<T>) 
	{
		super(child);
	}
	
	override function update(context : T, dt : Float) : Status
	{
		return Status.FAILURE;
	}
}
package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.Decorator;

/**
 * Will always succeed no matter whether the child succeeds or fails
 * @author Kenton Hamaluik
 */
class AlwaysSucceed extends Decorator
{
	public function new(?child : Behavior) 
	{
		super(child);
	}
	
	override function update(context : Dynamic, dt : Float) : Status
	{
		return Status.SUCCESS;
	}
}
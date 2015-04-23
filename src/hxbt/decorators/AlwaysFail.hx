package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.Decorator;

/**
 * Will always fail no matter whether the child succeeds or fails
 * @author Kenton Hamaluik
 */
class AlwaysFail extends Decorator
{
	public function new(?child : Behavior) 
	{
		super(child);
	}
	
	override function update(context : Dynamic, dt : Float) : Status
	{
		return Status.FAILURE;
	}
}
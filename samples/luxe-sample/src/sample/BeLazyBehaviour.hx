package sample;

import hxbt.Behavior;

class BeLazyBehaviour extends Behavior<Blackboard>
{
	public function new()
	{
		super();
	}
	
	override function update(context : Blackboard, dt : Float) : Status
	{
		return Status.RUNNING;
	}
}
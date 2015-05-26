package sample;

import hxbt.Behavior;
import luxe.Vector;

class WalkThroughDoorBehaviour extends Behavior<Blackboard> 
{
	var targetPosition:Vector;

	public function new()
	{
		super();
	}
	
	override function onInitialize(context : Blackboard) : Void
	{
		targetPosition = context.door.pos.clone().add_xyz(32);
	}
	
	override function update(context : Blackboard, dt : Float) : Status
	{
		if(targetPosition.clone().subtract(context.actor.pos).length <= 16) {
			cast(context.actor.get('Walk'), Walk).target = null;
			return Status.SUCCESS;
		}
		else {
			cast(context.actor.get('Walk'), Walk).target = targetPosition;
		}
		return Status.RUNNING;
	}
}
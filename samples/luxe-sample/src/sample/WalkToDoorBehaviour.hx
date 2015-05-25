package sample;

#if !behaviour
import hxbt.Behavior;
import luxe.Vector;
import Main.ActorContext;

class WalkToDoorBehaviour extends Behavior {
	var targetPosition:Vector;

	public function new()
	{
		super();
	}
	
	override function onInitialize(context : ActorContext) : Void
	{
		targetPosition = context.door.pos.clone();
	}
	
	override function update(context : ActorContext, dt : Float) : Status
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
#end
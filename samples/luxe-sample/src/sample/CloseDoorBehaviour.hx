package sample;

import hxbt.Behavior;
import sample.Door;
import sample.Door.DoorState;

class CloseDoorBehaviour extends Behavior<Blackboard> 
{
	public function new()
	{
		super();
	}
	
	override function update(context : Blackboard, dt : Float) : Status
	{
		var door:Door = cast(context.door.get('Door'), Door);
		door.close();
		if(door.state == DoorState.CLOSED) {
			return Status.SUCCESS;
		}
		return Status.RUNNING;
	}
}
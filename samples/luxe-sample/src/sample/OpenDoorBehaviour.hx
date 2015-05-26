package sample;

import hxbt.Behavior;
import sample.Door;
import sample.Door.DoorState;

class OpenDoorBehaviour extends Behavior<Blackboard> 
{
	public function new()
	{
		super();
	}
	
	override function update(context : Blackboard, dt : Float) : Status
	{
		var door:Door = cast(context.door.get('Door'), Door);
		door.open();
		if(door.state == DoorState.OPEN) {
			return Status.SUCCESS;
		}
		return Status.RUNNING;
	}
}
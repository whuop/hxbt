package sample;

#if !behaviour
import hxbt.Behavior;
import Main.ActorContext;
import sample.Door;
import sample.Door.DoorState;

class OpenDoorBehaviour extends Behavior {
	public function new()
	{
		super();
	}
	
	override function update(context : ActorContext, dt : Float) : Status
	{
		var door:Door = cast(context.door.get('Door'), Door);
		door.open();
		if(door.state == DoorState.OPEN) {
			return Status.SUCCESS;
		}
		return Status.RUNNING;
	}
}
#end
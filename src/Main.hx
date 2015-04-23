package;

#if !behaviour
import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.composites.Sequence;
import luxe.Component;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

typedef ActorContext = {
	var actor:Sprite;
	var door:Sprite;
}

class Main extends luxe.Game 
{
	var actor:Sprite;
	var door:Sprite;
	var behaviourTree:BehaviorTree;

	override function ready() 
	{
		// create our dude who's going to walk around
		var actor:Sprite = new Sprite({
			pos: new Vector((Luxe.screen.w / 2) - 128, Luxe.screen.h / 2),
			size: new Vector(16, 16),
			color: new Color(0.9, 0.9, 0.9, 1),
			origin: new Vector(8, 16)
		});
		actor.add(new Walk(128));

		// create a door for him to walk through
		door = new Sprite({
			pos: new Vector((Luxe.screen.w / 2) + 128, Luxe.screen.h / 2),
			size: new Vector(16, 32),
			color: new Color(0.5, 0.25, 0, 1),
			origin: new Vector(8, 32)
		});
		door.add(new Door(16, 2));

		// create a behaviour tree for the dude's actions
		behaviourTree = new BehaviorTree(0.1);

		// construct a sequence of events
		var rootSequence:Sequence = new Sequence();
		rootSequence.add(new WalkToDoorBehaviour());
		rootSequence.add(new OpenDoorBehaviour());
		rootSequence.add(new WalkThroughDoorBehaviour());
		rootSequence.add(new CloseDoorBehaviour());
		rootSequence.add(new BeLazyBehaviour());

		// setup the tree
		behaviourTree.set(rootSequence, {
			actor: actor,
			door: door
		});
	}

	override function onkeyup(e:KeyEvent) 
	{
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}

	override function update(dt:Float) 
	{
		behaviourTree.update(dt);
	}
}

/*
 * Will move towards a location with a given velocity
 * @author Kenton Hamaluik
*/
class Walk extends Component {
	public var speed:Float = 32;
	public var target:Vector;
	public function new(?speed:Float) {
		super({ name: 'Walk' });
		if(speed != null) this.speed = speed;
	}

	override function update(dt:Float) {
		if(target != null) {
			entity.pos.add(target.clone().subtract(entity.pos).normalized.multiplyScalar(speed * dt));
		}
	}
}

enum DoorState {
	CLOSED;
	OPENING;
	OPEN;
	CLOSING;
}

/*
 * Animate the width of a sprite using "open()" and "close()" functions
 * @author Kenton Hamaluik
*/
class Door extends Component {
	public var state:DoorState;
	var closedWidth:Float;
	var openWidth:Float;
	var spr:Sprite;

	var speed:Float = 32;
	var targetWidth:Float = null;

	public function new(?closedWidth:Float, ?openWidth:Float) {
		super({ name: 'Door' });
		state = DoorState.CLOSED;
		this.closedWidth = closedWidth;
		this.openWidth = openWidth;
	}

	override function init() {
		spr = cast(entity, Sprite);
	}

	public function open() {
		if(state == DoorState.CLOSED) {
			state = DoorState.OPENING;
			targetWidth = openWidth;
		}
	}

	public function close() {
		if(state == DoorState.OPEN) {
			state = DoorState.CLOSING;
			targetWidth = closedWidth;
		}
	}

	override function update(dt:Float) {
		if(state == DoorState.OPENING) {
			spr.size.x -= speed * dt;
			if(spr.size.x <= openWidth) {
				spr.size.x = openWidth;
				state = DoorState.OPEN;
			}
		}
		else if(state == DoorState.CLOSING) {
			spr.size.x += speed * dt;
			if(spr.size.x >= closedWidth) {
				spr.size.x = closedWidth;
				state = DoorState.CLOSED;
			}
		}
	}
}

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

class WalkThroughDoorBehaviour extends Behavior {
	var targetPosition:Vector;

	public function new()
	{
		super();
	}
	
	override function onInitialize(context : ActorContext) : Void
	{
		targetPosition = context.door.pos.clone().add_xyz(32);
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

class CloseDoorBehaviour extends Behavior {
	public function new()
	{
		super();
	}
	
	override function update(context : ActorContext, dt : Float) : Status
	{
		var door:Door = cast(context.door.get('Door'), Door);
		door.close();
		if(door.state == DoorState.CLOSED) {
			return Status.SUCCESS;
		}
		return Status.RUNNING;
	}
}

class BeLazyBehaviour extends Behavior {
	public function new()
	{
		super();
	}
	
	override function update(context : ActorContext, dt : Float) : Status
	{
		return Status.RUNNING;
	}
}
#end
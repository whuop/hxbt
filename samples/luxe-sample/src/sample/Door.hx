package sample;

import luxe.Sprite;
import luxe.Component;
import luxe.Vector;

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
	var targetWidth:Float = 32;

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
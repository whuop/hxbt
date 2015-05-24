package sample;

#if !behaviour
import luxe.Sprite;
import luxe.Component;
import luxe.Vector;

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
#end
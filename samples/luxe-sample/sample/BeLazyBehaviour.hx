package sample;

#if !behaviour
import hxbt.Behavior;

class BeLazyBehaviour extends Behavior {
	public function new()
	{
		super();
	}
	
	override function update(context : Dynamic, dt : Float) : Status
	{
		return Status.RUNNING;
	}
}
#end
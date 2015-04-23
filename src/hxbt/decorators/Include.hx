package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.Decorator;

/**
 * Will always succeed no matter whether the child succeeds or fails
 * @author Kenton Hamaluik
 */
class Include extends Decorator
{
	var m_childTree : BehaviorTree;

	public function new(childTree : BehaviorTree) 
	{
		super();
		m_childTree = childTree;
	}
	
	override function update(context : Dynamic, dt : Float) : Status
	{
		m_childTree.update(dt);
		return Status.SUCCESS;
	}
}
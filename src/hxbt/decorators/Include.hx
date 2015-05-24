package hxbt.decorators;

import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.Decorator;

/**
 * Includes an entire behaviour tree as a child and runs it
 * @author Kenton Hamaluik
 */
class Include<T> extends Decorator<T>
{
	var m_childTree : BehaviorTree<T>;

	public function new(childTree : BehaviorTree<T>) 
	{
		super();
		m_childTree = childTree;
	}
	
	override function update(context : T, dt : Float) : Status
	{
		m_childTree.update(dt);
		return Status.SUCCESS;
	}
}
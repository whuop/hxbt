package hxbt.composites;

import hxbt.Behavior.Status;

/**
 * Similar to sequence, looks for one behavior that returns success and returns.
 * @author Kristian Brodal
 */
class Selector extends Composite
{
	private var m_currentChild : Behavior;
	private var m_currentIndex : Int;
	
	
	public function new() 
	{
		super();
	}
	
	override function onInitialize(context : Dynamic)
	{
		m_currentIndex = 0;
	}
	
	override function update(context : Dynamic, dt : Float) : Status
	{
		m_currentChild = m_children[m_currentIndex];
		var s = m_currentChild.tick(context, dt);
		
		//	If the child succeeds or is still running, early return.
		if (s != Status.FAILURE)
		{
			return s;
		}	
		m_currentIndex++;
		//	If the end of the children is hit, that means the whole thing fails.
		if (m_currentIndex == m_children.length)
		{
			//	Reset index otherwise it will crash on next run through
			m_currentIndex = 0;
			return Status.FAILURE;
		}

		return Status.RUNNING;
	}
	
}
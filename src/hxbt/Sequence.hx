package hxbt;
import hxbt.Behavior.Status;

/**
 * A sequence goes through all behaviors attached to it from left to right.
 * Keeps going through behavior until all behaviors have returned SUCCESS.
 * If a single behavior returns FAILURE, the whole sequence fails.
 * @author Kristian Brodal
 */
class Sequence extends Composite
{
	private var m_currentChild : Behavior;
	private var m_currentIndex : Int;
	
	
	public function new() 
	{
		super();
	}
	
	override function onInitialize()
	{
		m_currentIndex = 0;
	}
	
	override function update() : Status
	{
		//	Keep looping until a child says it is running.
		while (true)
		{
			m_currentChild = m_children[m_currentIndex];
			var s = m_currentChild.tick();
			
			//	If the child failed or is still running, early return.
			if (s != Status.SUCCESS)
			{
				return s;
			}	
			m_currentIndex++;
			//	If end of array hit the whole sequence succeeded.
			if (m_currentIndex == m_children.length)
			{
				//	Reset index otherwise it will crash on next run through
				m_currentIndex = 0;
				return Status.SUCCESS;
			}
		}
		
		return Status.INVALID;
	}
}
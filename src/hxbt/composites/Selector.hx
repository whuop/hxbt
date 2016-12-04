package hxbt.composites;

import hxbt.Behavior.Status;

/**
 * Similar to sequence, looks for one behavior that returns success and returns.
 * @author Kristian Brodal
 */
class Selector<T> extends Composite<T>
{
	private var m_currentChild : Behavior<T>;
	private var m_currentIndex : Int;
	private var m_allChildrenTick:Bool;

	
	public function new(allChildrenTick:Bool = false) 
	{
		super();
		m_allChildrenTick = allChildrenTick;
	}
	
	override function onInitialize(context : T)
	{
		m_currentIndex = 0;
	}
	
	override function onTerminate(context : T, status : Status)
	{
		for(_child in m_children)
		{
			_child.status = Status.INVALID;
		}
	}

	function updateAllChildren(context : T, dt : Float) : Status
	{
		var status:Status;
		for(index in m_currentIndex...m_children.length)
		{
			m_currentIndex = index;
			m_currentChild = m_children[index];
			status = m_currentChild.tick(context, dt);
			if(status == SUCCESS)
			{
				m_currentIndex = 0;
				return SUCCESS;
			}			
			else if(status == RUNNING)
			{
				return RUNNING;
			}
		}
		m_currentIndex = 0;
		return FAILURE;
	}
	
	function updateChildPerChild(context : T, dt : Float) : Status
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

	override function update(context : T, dt : Float) : Status
	{
		if(m_allChildrenTick)
		{
			return updateAllChildren(context, dt);
		}
		else
		{
			return updateChildPerChild(context, dt);
		}
	}
	
}
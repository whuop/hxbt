package hxbt.composites;
import hxbt.Behavior.Status;

/**
 * A sequence goes through all behaviors attached to it from left to right.
 * Keeps going through behavior until all behaviors have returned SUCCESS.
 * If a single behavior returns FAILURE, the whole sequence fails.
 * @author Kristian Brodal
 * @author Kenton Hamaluik
 */
class Sequence<T> extends Composite<T>
{
	private var m_currentChild : Behavior<T>;
	private var m_currentIndex : Int;
	private var m_allChildrenTick:Bool;

	
	/**
	 * @param allChildrenTick Should the Sequence try to update a whole cycle
	 * per tick or only one child.
	*/
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
			if(status == Status.FAILURE)
			{
				m_currentIndex = 0;
				return Status.FAILURE;

			}
			else if(status == Status.RUNNING)
			{
				return Status.RUNNING;
			}
		}
		// If we got there, every children returned SUCCESS
		m_currentIndex = 0;
		return SUCCESS;
	}

	function updateChildPerChild(context : T, dt : Float) : Status
	{
		// get the current child which is being evaluated
		m_currentChild = m_children[m_currentIndex];
		var s = m_currentChild.tick(context, dt);
		
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
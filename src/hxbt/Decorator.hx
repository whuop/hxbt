package hxbt;

/**
 * ...
 * @author Kenton Hamaluik
 */
class Decorator<T> extends Behavior<T>
{
	private var m_child : Behavior<T>;
	
	
	public function new(?child : Behavior<T>) 
	{
		super();
		m_child = child;
	}

	public function setChild(child : Behavior<T>) 
	{
		m_child = child;
	}
}
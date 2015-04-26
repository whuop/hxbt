package hxbt;

/**
 * ...
 * @author Kenton Hamaluik
 */
class Decorator extends Behavior
{
	private var m_child : Behavior;
	
	
	public function new(?child : Behavior) 
	{
		super();
		m_child = child;
	}

	public function setChild(child : Behavior) {
		m_child = child;
	}
}
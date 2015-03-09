package hxbt;

/**
 * ...
 * @author Kristian Brodal
 */
class Composite extends Behavior
{
	private var m_children : Array<Behavior>;
	
	
	public function new() 
	{
		super();
		m_children = new Array<Behavior>();
	}
	
	/*
	 * Add child to the end of the child array.
	 */
	public function add(b : Behavior)
	{
		m_children.push(b);
	}
	
	/*
	 * Remove given child from the array of children.
	 */
	public function remove(b : Behavior)
	{
		m_children.remove(b);
	}
}
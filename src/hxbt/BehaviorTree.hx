package hxbt;

/**
 * Base of a behavior tree, this is used to hold the rest of the tree for the AI
 * as this has extra functionality.
 * @author Kristian Brodal
 */
class BehaviorTree
{
	//	The period decides how often the behavior tree should update.
	//	Period of 0.2 will make the tree update 5 times a second.
	public var period(default, default) : Float;
	
	//	Root of the behavior tree.
	private var m_tree : Behavior;
	
	//	The context contains all the data needed to run
	//	the different behaviors. Also called blackboard in some cases.
	private var m_context : Dynamic;
	
	//	When counter reaches 0 tree is updated.
	private var m_counter : Float;

	public function new(?period:Float) 
	{
		//	0.2 will make the tree run 5 times a second.
		//	Used as default for now
		this.period = period == null ? 0.2 : period;
		m_counter = this.period;
	}
	
	public function set(root : Behavior, context : Dynamic) : Void
	{
		m_tree = root;
		m_context = context;
	}
	
	public function update(dt : Float) : Void
	{
		m_counter -= dt;
		while (m_counter <= 0)
		{
			m_counter += this.period;
			if (m_tree != null)
			{
				m_tree.tick(m_context, this.period);
			}
		}
	}
}
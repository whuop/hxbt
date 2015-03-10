package hxbt;

/**
 * Base of a behavior tree, this is used to hold the rest of the tree for the AI
 * as this has extra functionality.
 * @author Kristian Brodal
 */
class BehaviorTree
{
	//	The frequency decides how often the behavior tree should update.
	//	Frequency of 0.2 will make the tree update 5 times a second.
	public var frequency(get, set) : Float;
	
	//	Root of the behavior tree.
	private var m_tree : Behavior;
	
	//	When counter reaches 0 tree is updated.
	private var m_counter : Float;

	public function new() 
	{
		//	Will make the tree run 5 times a second.
		//	Used as default for now
		this.frequency = 0.2;
		m_counter = this.frequency;
	}
	
	public function setTree(root : Behavior) : Void
	{
		m_tree = root;
	}
	
	public function update(dt : Float) : Void
	{
		m_counter -= dt;
		if (m_counter < 0)
		{
			m_counter = this.frequency;
			if (m_tree != null)
			{
				m_tree.tick();
			}
		}
	}
}
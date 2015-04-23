package;

import nodes.BaseNode;
class NodeManager
{
	private static var m_instance : NodeManager;
	
	private var m_nodes : Array<BaseNode>;
	
	private function new() 
	{
		m_nodes = new Array<BaseNode>();
	}
	
	public static function Instance() : NodeManager
	{
		if (m_instance == null)
		{
			m_instance = new NodeManager();
		}
		return m_instance;
	}
	
	public static function Add(n : BaseNode) : Void
	{
		Instance().add(n);
	}
	
	private function add(n : BaseNode) : Void
	{
		m_nodes.push(n);
	}
	
	public static function Remove(n : BaseNode) : Void
	{
		Instance().remove(n);
	}
	
	private function remove(n : BaseNode) : Void
	{
		m_nodes.remove(n);
	}
}
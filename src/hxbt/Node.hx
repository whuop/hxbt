package hxbt;

/**
 * ...
 * @author Kristian Brodal
 */
class Node
{

	public function new() 
	{
		
	}
	
	public function create() : Task
	{
		return new Task(this);
	}
	
	public function destroy(task : Task) : Void
	{
		
	}
	
}
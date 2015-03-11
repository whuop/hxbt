package hxbt.loaders;
import hxbt.BehaviorTree;

/**
 * The BehaviorTreeJSONLoader loads a behavior from a JSON file
 * with a very simple structure.
 * The structure of the behavior tree json is the following:

	{
		"tree_name" : 
		[
			"hxbt.selector" : 
			[
				"hxbt.sequence" : 
				[
					"package.behavior0" : [],
					"package.behavior1" : []
				],
				"hxbt.sequence" : 
				[
					"package.behavior2" : [],
					"package.behavior3" : []
				]
			]
		]
	}
	 
 * @author Kristian Brodal
 */
class BehaviorTreeJSONLoader
{

	private function new() 
	{
		
	}
	
	public static function FromJSONString() : BehaviorTree
	{
		return null;
	}
	
	public static function FromJSONObject() : BehaviorTree
	{
		return null;
	}
}
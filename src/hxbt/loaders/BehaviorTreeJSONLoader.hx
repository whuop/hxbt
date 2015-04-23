package hxbt.loaders;
import hxbt.BehaviorTree;

/**
 * The BehaviorTreeJSONLoader loads a behavior from a JSON file
 * with a very simple structure.
 * The structure of the behavior tree JSON is the following:

{
	"trees" :
	[
		{
			"name" : "my.first.tree",
			"tree" : 
			{
				"hxbt.selector" : 
				[
					{
						"hxbt.sequence" : 
						[
							{ "package.behavior0" : [] },
							{ "package.behavior1" : [] }
						]
					},
					{
						"hxbt.sequence" : 
						[
							{ "package.behavior2" : [] },
							{ "package.behavior3" : [] }
						]
					}
				]
			}
		}
	]
}
	 
 * @author Kristian Brodal
 */
class BehaviorTreeJSONLoader
{

	private function new() 
	{
		
	}
	
	//	Constructs the behavior tree 'treeName' defined in the JSON file 'JSON'.
	//	Returns constructed tree if successful, returns null if unsuccessful.
	public static function FromJSONString(JSON : String, treeName : String) : BehaviorTree
	{
		return FromJSONObject(haxe.Json.parse(JSON), treeName);
	}
	
	//	Constructs the behavior tree 'treeName' defined in the JSON file 'JSON'.
	//	Returns constructed tree if successful, returns null if unsuccessful.
	public static function FromJSONObject(JSON : Dynamic, treeName : String) : BehaviorTree
	{
		// for later
		var tree:Dynamic;

		// find the desired tree
		for(_tree in JSON.trees)
		{
			if(_tree.name == treeName)
			{
				// found it!
				tree = _tree;

				// finish processing
				break;
			}
		}

		// make sure it was found
		if(tree == null)
		{
			return null;
		}

		// todo...
	}
}
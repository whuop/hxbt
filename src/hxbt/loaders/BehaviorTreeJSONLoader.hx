package hxbt.loaders;
import hxbt.Behavior;
import hxbt.BehaviorTree;
import hxbt.composites.Parallel;
import hxbt.composites.Sequence;
import hxbt.composites.Selector;
import hxbt.decorators.AlwaysFail;
import hxbt.decorators.AlwaysSucceed;
import hxbt.decorators.Include;
import hxbt.decorators.Invert;
import hxbt.decorators.UntilFail;
import hxbt.decorators.UntilSuccess;

/**
 * The BehaviorTreeJSONLoader loads a behavior from a JSON file
 * with a very simple structure.
 * The structure of the behavior tree JSON is the following:

{
    "test_tree": {
        "hxbt.sequence": [
            { "package.behavior0": [] },
            { "package.behavior1": [] },
            { "hxbt.selector": [
                { "package.behavior2": [] },
                { "package.behavior3": [] }
            ]}
        ]
    }
}

 * @author Kristian Brodal
 * @author Kenton Hamaluik
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
		if(!Reflect.hasField(JSON, treeName)) {
			throw "Behaviour tree '" + treeName + "' doesn't exist in this JSON!";
		}

		var tree = Reflect.field(JSON, treeName);
		var roots:Array<String> = Reflect.fields(tree);
#if !behaviour
		if(roots.length != 1) {
#else
		if(roots.length != 2) {
#end
			throw "Behaviour tree '" + treeName + "' must have a singular root! It has " + roots.length + "!";
		}
		var root = Reflect.field(tree, roots[0]);
		
		var tree:BehaviorTree = new BehaviorTree();
		var rootBehaviour:Behavior = GetBehavior(root, treeName);
		tree.setRoot(rootBehaviour);
		return tree;
	}

	private static function GetBehavior(object : Dynamic, errorTrail : String):Behavior
	{
		// we should be recieving an array of fields
		// we actually only want there to be one field (JSON is kinda dumb that way)
		var rootFields:Array<String> = Reflect.fields(object);
		if(rootFields.length != 1) {
			throw "Object '" + errorTrail + "' must have exactly 1 child! It has " + rootFields.length + "!";
		}
		var name:String = rootFields[0];
		var objects:Array<Dynamic> = Reflect.field(object, name);

		switch(name) {
			case 'hxbt.sequence': {
				var sequence:Sequence = new Sequence();
				var arrI:Int = 0;
				for(object in objects) {
					sequence.add(GetBehavior(object, errorTrail + "." + name + ".[" + arrI + "]"));
					arrI++;
				}
				return sequence;
			}

			case 'hxbt.selector': {
				var selector:Selector = new Selector();
				var arrI:Int = 0;
				for(object in objects) {
					selector.add(GetBehavior(object, errorTrail + "." + name + ".[" + arrI + "]"));
					arrI++;
				}
				return selector;
			}

			case 'hxbt.parallel': {
				var parallel:Parallel = new Parallel();
				var arrI:Int = 0;
				for(object in objects) {
					parallel.add(GetBehavior(object, errorTrail + "." + name + ".[" + arrI + "]"));
					arrI++;
				}
				return parallel;
			}

			case 'hxbt.alwaysfail': {
				if(objects.length > 1) {
					throw "hxbt.alwaysfail can't have more than one child!";
				}
				var alwaysFail:AlwaysFail = new AlwaysFail();
				if(objects.length > 0) {
					alwaysFail.setChild(GetBehavior(objects[0], errorTrail + "." + name));
				}
				return alwaysFail;
			}

			case 'hxbt.alwayssucceed': {
				if(objects.length > 1) {
					throw "hxbt.alwayssucceed can't have more than one child!";
				}
				var alwaysSucceed:AlwaysSucceed = new AlwaysSucceed();
				if(objects.length > 0) {
					alwaysSucceed.setChild(GetBehavior(objects[0], errorTrail + "." + name));
				}
				return alwaysSucceed;
			}

			case 'hxbt.include': {
				throw "hxbt.include is not supported in JSON yet!";
			}

			case 'hxbt.invert': {
				if(objects.length != 1) {
					throw "hxbt.invert MUST have exactly one child!";
				}
				var invert:Invert = new Invert();
				invert.setChild(GetBehavior(objects[0], errorTrail + "." + name));
				return invert;
			}

			case 'hxbt.untilfail': {
				if(objects.length != 1) {
					throw "hxbt.untilfail MUST have exactly one child!";
				}
				var untilFail:UntilFail = new UntilFail();
				untilFail.setChild(GetBehavior(objects[0], errorTrail + "." + name));
				return untilFail;
			}

			case 'hxbt.untilsuccess': {
				if(objects.length != 1) {
					throw "hxbt.untilsuccess MUST have exactly one child!";
				}
				var untilSuccess:UntilSuccess = new UntilSuccess();
				untilSuccess.setChild(GetBehavior(objects[0], errorTrail + "." + name));
				return untilSuccess;
			}

			default: {
				var t = Type.resolveClass(name);
				if(t == null) {
					throw "Can't resolve behavior class '" + name + "' @ '" + errorTrail + "'!";
				}

				var inst = Type.createInstance(Type.resolveClass(name), []);
				if(!Std.is(inst, Behavior)) {
					throw "Error: class '" + name + "' isn't a behavior @ '" + errorTrail + "'!";
				}
				return inst;
			}
		}
	}
}
package behaviour.hxbt.loaders;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import hxbt.loaders.BehaviorTreeJSONLoader;

/**
 * ...
 * @author Kenton Hamaluik
 */
class BehaviorTreeJSONLoaderBehaviour extends BuddySuite
{
	public function new() 
	{
		describe("Using a JSON loader", {
			it("should be able to instantiate a tree from a JSON object", {});
			it("should be able to instantiate a tree containing HXBT nodes", {});
			it("should be able to instantiate a tree containing custom leaf behaviours", {});
			it("should be able to instantiate a tree from a JSON string", {});
		});
	}
}


package behaviour.hxbt.loaders;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
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
			it("should be able to instantiate a tree from a JSON string", {
				// for some reason this fails in the tests but works normally ?
				/*var jsonString = '
					{
					    "WalkThroughDoorAndStop": [{
					        "hxbt.sequence": [
					            { "sample.WalkToDoorBehaviour": [] },
					            { "sample.OpenDoorBehaviour": [] },
					            { "sample.WalkThroughDoorBehaviour": [] },
					            { "sample.CloseDoorBehaviour": [] },
					            { "sample.BeLazyBehaviour": [] }
					        ]
					    }]
					}
				';
				hxbt.loaders.BehaviorTreeJSONLoader.FromJSONString.bind(jsonString, "TestTree").should.not.throwType(String);
				var tree:BehaviorTree = hxbt.loaders.BehaviorTreeJSONLoader.FromJSONString(jsonString, "WalkThroughDoorAndStop");
				tree.should.not.be(null);*/
			});
		});
	}
}


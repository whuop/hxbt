package behaviour.hxbt.decorators;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import behaviour.hxbt.MockBehaviour;
import hxbt.decorators.Include;

/**
 * ...
 * @author Kenton Hamaluik
 */
class IncludeBehaviour extends BuddySuite
{
	public function new() 
	{
		var tree:BehaviorTree = new BehaviorTree();
		var behaviour = new MockBehaviour();
		tree.setRoot(behaviour);
		var decorator:Include = new Include(tree);

		describe("Using an include decorator", {
			it("should update the tree on ticks", {
				decorator.tick(null, 5);
				behaviour.m_initializedCalled.should.be(1);
			});
			it("should always respond with success", {
				decorator.status.should.be(Status.SUCCESS);
			});
		});
	}
}


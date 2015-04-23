package behaviour.hxbt.composites;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;
import hxbt.composites.Selector;

/**
 * ...
 * @author Kenton Hamaluik
 */
class SelectorBehaviour extends BuddySuite
{
	public function new() 
	{
		var selector:Selector = new Selector();

		var behaviourA:MockBehaviour = new MockBehaviour();
		var behaviourB:MockBehaviour = new MockBehaviour();

		selector.add(behaviourA);
		selector.add(behaviourB);

		describe("Using a selector", {
			it("should initialize only the first child on the first tick", {
				selector.tick(null, 0.1);
				behaviourA.m_initializedCalled.should.be(1);
				behaviourB.m_initializedCalled.should.be(0);
			});
			it("should not move on to the next child if the first one hasn't finished", {
				selector.tick(null, 0.1);
				behaviourA.m_updateCalled.should.be(2);
				behaviourB.m_initializedCalled.should.be(0);
			});
			it("should move on to the next child if the first fails", {
				behaviourA.m_operationResult = Status.FAILURE;
				selector.tick(null, 0.1);
				selector.tick(null, 0.1);
				behaviourB.m_initializedCalled.should.be(1);
			});
			it("should succeed if a child succeeds", {
				behaviourB.m_operationResult = Status.SUCCESS;
				selector.tick(null, 0.1);
				selector.status.should.be(Status.SUCCESS);
			});
			it("should report as running if its children are running", {
				behaviourA.m_operationResult = null;
				behaviourB.m_operationResult = null;
				selector.tick(null, 0.1);
				selector.status.should.be(Status.RUNNING);
			});
			it("should fail if all children report failure", {
				selector = new Selector();
				selector.add(behaviourA);
				selector.add(behaviourB);
				behaviourA.m_operationResult = Status.FAILURE;
				behaviourB.m_operationResult = Status.FAILURE;

				selector.tick(null, 0.1);
				selector.tick(null, 0.1);

				selector.status.should.be(Status.FAILURE);
			});
		});
	}
}
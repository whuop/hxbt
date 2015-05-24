package behaviour.hxbt.composites;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;
import hxbt.composites.Sequence;

/**
 * ...
 * @author Kenton Hamaluik
 */
class SequenceBehaviour extends BuddySuite
{
	public function new() 
	{
		var sequence:Sequence = new Sequence();

		var behaviourA:MockBehaviour = new MockBehaviour();
		var behaviourB:MockBehaviour = new MockBehaviour();

		sequence.add(behaviourA);
		sequence.add(behaviourB);

		describe("Using a sequence", {
			it("should initialize only the first child on the first tick", {
				sequence.tick(null, 0.1);
				behaviourA.m_initializedCalled.should.be(1);
				behaviourB.m_initializedCalled.should.be(0);
			});
			it("should not move on to the next child if the first one hasn't finished", {
				sequence.tick(null, 0.1);
				behaviourA.m_updateCalled.should.be(2);
				behaviourB.m_initializedCalled.should.be(0);
			});
			it("should move on to the next child if the first finishes", {
				behaviourA.m_operationResult = Status.SUCCESS;
				sequence.tick(null, 0.1);
				sequence.tick(null, 0.1);
				behaviourA.m_updateCalled.should.be(3);
				behaviourB.m_initializedCalled.should.be(1);
			});
			it("should succeed if all children succeed", {
				behaviourB.m_operationResult = Status.SUCCESS;
				sequence.tick(null, 0.1);
				sequence.status.should.be(Status.SUCCESS);
			});
			it("should report as running if its children are running", {
				behaviourA.m_operationResult = null;
				behaviourB.m_operationResult = null;
				sequence.tick(null, 0.1);
				sequence.status.should.be(Status.RUNNING);
			});
			it("should fail if a child returns failure", {
				behaviourA.m_operationResult = Status.FAILURE;
				sequence.tick(null, 0.1);
				sequence.status.should.be(Status.FAILURE);
			});
			it("should invalidate all its children when it terminates", {
				behaviourA.status.should.be(Status.INVALID);
				behaviourB.status.should.be(Status.INVALID);
			});
		});
	}
}
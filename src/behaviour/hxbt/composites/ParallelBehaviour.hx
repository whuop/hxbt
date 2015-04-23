package behaviour.hxbt.composites;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;
import hxbt.composites.Parallel;

/**
 * ...
 * @author Kenton Hamaluik
 */
class ParallelBehaviour extends BuddySuite
{
	public function new() 
	{
		var parallel:Parallel = new Parallel();

		var behaviourA:MockBehaviour = new MockBehaviour();
		var behaviourB:MockBehaviour = new MockBehaviour();

		parallel.add(behaviourA);
		parallel.add(behaviourB);

		describe("Using a parallel", {
			it("should initialize every child on the first tick", {
				parallel.tick(null, 0.1);
				behaviourA.m_initializedCalled.should.be(1);
				behaviourB.m_initializedCalled.should.be(1);
			});
			it("should update every child only once on each tick", {
				behaviourA.m_updateCalled.should.be(1);
				behaviourB.m_updateCalled.should.be(1);
			});
			it("should keep running if not all of its children succeed", {
				behaviourA.m_operationResult = Status.SUCCESS;
				parallel.tick(null, 0.1);
				parallel.status.should.be(Status.RUNNING);
			});
			it("should succeed if all of its children succeed", {
				behaviourB.m_operationResult = Status.SUCCESS;
				parallel.tick(null, 0.1);
				parallel.status.should.be(Status.SUCCESS);
			});
			it("should fail if any of it's children fail", {
				behaviourA.m_operationResult = null;
				behaviourB.m_operationResult = null;
				parallel.tick(null, 0.1);
			
				behaviourB.m_operationResult = Status.FAILURE;
				parallel.tick(null, 0.1);
				parallel.status.should.be(Status.FAILURE);
			});
			it("should invalidate all its children when it terminates", {
				behaviourA.status.should.be(Status.INVALID);
				behaviourB.status.should.be(Status.INVALID);
			});
		});
	}
}
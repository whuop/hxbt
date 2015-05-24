package behaviour.hxbt;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;

/**
 * ...
 * @author Kenton Hamaluik
 */
class BehaviorBehaviour extends BuddySuite
{
	public function new() 
	{
		var behaviour = new MockBehaviour();

		describe("Using a subclassed behaviour", {
			it("should not have been initialized without ticking", {
				behaviour.m_initializedCalled.should.be(0);
			});
			it("should should auto-initialize on it's first tick", {
				behaviour.tick(null, 0.1);
				behaviour.m_initializedCalled.should.be(1);
			});
			it("should have updated on it's first tick", {
				behaviour.m_updateCalled.should.be(1);
			});
			it("should not have terminated without the leaf saying so", {
				behaviour.m_terminateCalled.should.be(0);
				behaviour.m_terminateStatus.should.be(null);
			});
			it("should not re-initialize after the first time without terminating first", {
				behaviour.tick(null, 0.1);
				behaviour.m_initializedCalled.should.be(1);
				behaviour.m_updateCalled.should.be(2);
			});
			it("should terminate whe the leaf says so", {
				behaviour.m_operationResult = Status.SUCCESS;
				behaviour.tick(null, 0.1);
				behaviour.m_updateCalled.should.be(3);
				behaviour.m_terminateCalled.should.be(1);
				behaviour.m_terminateStatus.should.be(Status.SUCCESS);
			});
		});
	}
}


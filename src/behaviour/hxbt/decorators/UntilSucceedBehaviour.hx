package behaviour.hxbt.decorators;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;
import hxbt.decorators.UntilSuccess;

/**
 * ...
 * @author Kenton Hamaluik
 */
class UntilSucceedBehaviour extends BuddySuite
{
	public function new() 
	{
		var decorator:UntilSuccess = new UntilSuccess();
		var behaviour = new MockBehaviour();
		decorator.setChild(behaviour);

		describe("Using an until success decorator", {
			it("should report as running if the child is running", {
				behaviour.m_operationResult = null;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.RUNNING);
			});
			it("should report as running if the child fails", {
				behaviour.m_operationResult = Status.FAILURE;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.RUNNING);
			});
			it("should report as success if the child succeeds", {
				behaviour.m_operationResult = Status.SUCCESS;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.SUCCESS);
			});
		});
	}
}


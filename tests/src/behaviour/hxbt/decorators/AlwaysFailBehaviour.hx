package behaviour.hxbt.decorators;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;
import hxbt.decorators.AlwaysFail;

/**
 * ...
 * @author Kenton Hamaluik
 */
class AlwaysFailBehaviour extends BuddySuite
{
	public function new() 
	{
		var decorator:AlwaysFail = new AlwaysFail();
		var behaviour = new MockBehaviour();
		decorator.setChild(behaviour);

		describe("Using an always fail decorator", {
			it("should respond with failure if the child succeeds", {
				behaviour.m_operationResult = Status.SUCCESS;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.FAILURE);
			});
			it("should respond with failure if the child fails", {
				behaviour.m_operationResult = Status.FAILURE;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.FAILURE);
			});
			it("should respond with failure if the child is running", {
				behaviour.m_operationResult = null;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.FAILURE);
			});
			it("should respond with failure if the child is invalid", {
				behaviour.m_operationResult = Status.INVALID;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.FAILURE);
			});
		});
	}
}


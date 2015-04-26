package behaviour.hxbt.decorators;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;
import hxbt.decorators.AlwaysSucceed;

/**
 * ...
 * @author Kenton Hamaluik
 */
class AlwaysSucceedBehaviour extends BuddySuite
{
	public function new() 
	{
		var decorator:AlwaysSucceed = new AlwaysSucceed();
		var behaviour = new MockBehaviour();
		decorator.setChild(behaviour);

		describe("Using an always succeed decorator", {
			it("should respond with success if the child succeeds", {
				behaviour.m_operationResult = Status.SUCCESS;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.SUCCESS);
			});
			it("should respond with success if the child fails", {
				behaviour.m_operationResult = Status.FAILURE;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.SUCCESS);
			});
			it("should respond with success if the child is running", {
				behaviour.m_operationResult = null;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.SUCCESS);
			});
			it("should respond with success if the child is invalid", {
				behaviour.m_operationResult = Status.INVALID;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.SUCCESS);
			});
		});
	}
}


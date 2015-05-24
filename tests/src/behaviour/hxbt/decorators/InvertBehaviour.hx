package behaviour.hxbt.decorators;

import buddy.*;
using buddy.Should;

import hxbt.Behavior.Status;
import behaviour.hxbt.MockBehaviour;
import hxbt.decorators.Invert;

/**
 * ...
 * @author Kenton Hamaluik
 */
class InvertBehaviour extends BuddySuite
{
	public function new() 
	{
		var decorator:Invert = new Invert();
		var behaviour = new MockBehaviour();
		decorator.setChild(behaviour);

		describe("Using an inverter decorator", {
			it("should respond with failure if the child succeeds", {
				behaviour.m_operationResult = Status.SUCCESS;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.FAILURE);
			});
			it("should respond with success if the child fails", {
				behaviour.m_operationResult = Status.FAILURE;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.SUCCESS);
			});
			it("should respond with running if the child is running", {
				behaviour.m_operationResult = null;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.RUNNING);
			});
			it("should respond with invalid if the child is invalid", {
				behaviour.m_operationResult = Status.INVALID;
				decorator.tick(null, 0.1);
				decorator.status.should.be(Status.INVALID);
			});
		});
	}
}


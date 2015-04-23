package behaviour.hxbt.composites;

import buddy.*;
using buddy.Should;

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
		var behaviourC:MockBehaviour = new MockBehaviour();

		sequence.add(behaviourA);
		sequence.add(behaviourB);
		sequence.add(behaviourC);

		describe("Using a sequence", {
			it("should initialize only the first child on the first tick", {
				sequence.tick(null, 0.1);
				behaviourA.m_initializedCalled.should.be(1);
				behaviourB.m_initializedCalled.should.be(0);
				behaviourC.m_initializedCalled.should.be(0);
			});
			it("should not move on to the next child if the first one hasn't finished", {
				sequence.tick(null, 0.1);
				behaviourA.m_updateCalled.should.be(2);
				behaviourB.m_initializedCalled.should.be(0);
				behaviourC.m_initializedCalled.should.be(0);
			});
		});
	}
}
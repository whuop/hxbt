package tests;

import hxbt.Behavior;
import tests.BehaviorTest.TestBehavior;

/**
 * Behavior test runs through a behavior to make sure that 
 * it is running the way it should be.
 * @author Kristian Brodal
 */
class BehaviorTest
{
	public function new() 
	{
		var behavior = new TestBehavior();
		behavior.tick();
		trace('/----------- BEHAVIOR TEST -----------/');
		trace('Initialized called: ${behavior.m_initializedCalled}');
		trace('Update called: ${behavior.m_updateCalled}');
		trace('Terminade called: ${behavior.m_terminateCalled}');
		trace('Terminated with status: ${behavior.m_terminateStatus}');
		trace('/--------- END BEHAVIOR TEST ---------/');
	}
}


class TestBehavior extends Behavior
{
	public var m_initializedCalled = 0;
	public var m_terminateCalled = 0;
	public var m_updateCalled = 0;
	
	public var m_terminateStatus : Status;
	
	public function new()
	{
		super();
	}
	
	override function onInitialize() : Void
	{
		m_initializedCalled++;
	}
	
	override function onTerminate(status : Status) : Void
	{
		m_terminateCalled++;
		m_terminateStatus = status;
	}
	
	override function update() : Status
	{
		m_updateCalled++;
		return Status.SUCCESS;
	}
}
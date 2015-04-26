package behaviour.hxbt;

import hxbt.Behavior;

class MockBehaviour extends Behavior
{
	public var m_initializedCalled = 0;
	public var m_terminateCalled = 0;
	public var m_updateCalled = 0;
	
	public var m_terminateStatus : Status;

	public var m_operationResult:Status = null;
	
	public function new()
	{
		super();
	}
	
	override function onInitialize(context : Dynamic) : Void
	{
		m_initializedCalled++;
	}
	
	override function onTerminate(context : Dynamic, status : Status) : Void
	{
		m_terminateCalled++;
		m_terminateStatus = status;
	}
	
	override function update(context : Dynamic, dt : Float) : Status
	{
		m_updateCalled++;
		if(m_operationResult != null)
		{
			return m_operationResult;
		}
		return Status.RUNNING;
	}
}
package gen2tests;

import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.Node;
import hxbt.Task;

/**
 * ...
 * @author Kristian Brodal
 */
class TaskTest
{
	public function new() 
	{
		var n : new TestNode();
		
		var behavior = new Behavior(n);
		
		behavior.tick();
		trace('/----------- TASK TEST -----------/');
		//trace('Initialized called: ${behavior.m_initializedCalled}');
		//trace('Update called: ${behavior.m_updateCalled}');
		//trace('Terminade called: ${behavior.m_terminateCalled}');
		//trace('Terminated with status: ${behavior.m_terminateStatus}');
		trace('/--------- END TASK TEST ---------/');
	}
}


class TestTask extends Task
{
	public var m_initializedCalled = 0;
	public var m_terminateCalled = 0;
	public var m_updateCalled = 0;
	
	public var m_terminateStatus : Status;
	
	public function new(node : Node)
	{
		super(node);
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


class TestNode extends Node
{
	private var m_task : Task;
	
	override function destroy(task : Task) : Void { }
	
	override public function create():Task 
	{
		m_task = new TestTask(this);
		return m_task;
	}
}
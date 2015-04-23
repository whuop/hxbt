package;

#if !behaviour
import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.composites.Sequence;
import luxe.Component;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

import sample.Walk;
import sample.Door;

import sample.WalkToDoorBehaviour;
import sample.OpenDoorBehaviour;
import sample.WalkThroughDoorBehaviour;
import sample.CloseDoorBehaviour;
import sample.BeLazyBehaviour;

typedef ActorContext = {
	var actor:Sprite;
	var door:Sprite;
}

class Main extends luxe.Game 
{
	var actor:Sprite;
	var door:Sprite;
	var behaviourTree:BehaviorTree;

	override function ready() 
	{
		// create our dude who's going to walk around
		var actor:Sprite = new Sprite({
			pos: new Vector((Luxe.screen.w / 2) - 128, Luxe.screen.h / 2),
			size: new Vector(16, 16),
			color: new Color(0.9, 0.9, 0.9, 1),
			origin: new Vector(8, 16)
		});
		actor.add(new Walk(128));

		// create a door for him to walk through
		door = new Sprite({
			pos: new Vector((Luxe.screen.w / 2) + 128, Luxe.screen.h / 2),
			size: new Vector(16, 32),
			color: new Color(0.5, 0.25, 0, 1),
			origin: new Vector(8, 32)
		});
		door.add(new Door(16, 2));

		Luxe.loadJSON("assets/behavior_trees.json", function(res) {
			try {
				behaviourTree = hxbt.loaders.BehaviorTreeJSONLoader.FromJSONObject(res.json, "WalkThroughDoorAndStop");
				behaviourTree.setContext({
					actor: actor,
					door: door
				});
			}
			catch(err:String) {
				trace("ERROR: " + err);
			}
		});
	}

	override function onkeyup(e:KeyEvent) 
	{
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}

	override function update(dt:Float) 
	{
		if(behaviourTree != null) {
			behaviourTree.period = dt; // make it update every frame
			behaviourTree.update(dt);
		}
	}
}

#end
package;

import luxe.Game;
import luxe.Sprite;
import luxe.Vector;
import sample.Blackboard;
import luxe.Color;
import sample.Walk;
import sample.Door;
import hxbt.BehaviorTree;
import hxbt.composites.Sequence;

import sample.WalkToDoorBehaviour;
import sample.OpenDoorBehaviour;
import sample.WalkThroughDoorBehaviour;
import sample.CloseDoorBehaviour;
import sample.BeLazyBehaviour;


class Main extends Game
{
	var actor:Sprite;
	var door:Sprite;
	var behaviorTree:BehaviorTree<Blackboard>;

	public override function ready() 
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
		
		var bb = new Blackboard();
		bb.actor = actor;
		bb.door = door;

		behaviorTree = new BehaviorTree<Blackboard>();
		var sequence = new Sequence<Blackboard>();
		behaviorTree.setRoot(sequence);
		sequence.add(new WalkToDoorBehaviour( ));
		sequence.add(new OpenDoorBehaviour( ));
		sequence.add(new WalkThroughDoorBehaviour( ));
		sequence.add(new CloseDoorBehaviour( ));
		sequence.add(new BeLazyBehaviour( ));

		behaviorTree.setContext(bb);
		/*var load = Luxe.resources.load_json("assets/behavior_trees.json");

		load.then(function(json:JSONResource){
			try {
				behaviourTree = hxbt.loaders.BehaviorTreeJSONLoader.FromJSONObject(json.asset.json, "WalkThroughDoorAndStop");
				behaviourTree.setContext({
					actor: actor,
					door: door
				});
			}
			catch(err:String) {
				trace("ERROR: " + err);
			}
		});*/
	}
	
	public override function update( dt:Float ) 
	{
		behaviorTree.update(dt);
    } //update

}
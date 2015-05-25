package;

import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.composites.Sequence;
import hxbt.composites.Selector;
import luxe.Game;
import luxe.Sprite;
import sample.Blackboard;

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
		
		behaviorTree = new BehaviorTree<Blackboard>();

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
		m_behaviorTree.update(dt);
    } //update

}
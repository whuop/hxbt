package nodes;
import luxe.Entity;

class BaseNode extends Entity
{
	public function new(name : String) 
	{
		super( { name : name } );
	}
}
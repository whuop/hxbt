package;

/**
 * ...
 * @author Kristian Brodal
 */
class Core
{
	public static var nodeManager;
	
	
	public static function Initialize()
	{
		Logger.Instance();
		nodeManager = new NodeManager();
	}
	
	private function new() : Void { }
}
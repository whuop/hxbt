package ;
import luxe.Events;
import luxe.Text;
import luxe.Vector;

/**
 * ...
 * @author Kristian Brodal
 */
class Logger
{
	
	private static var m_instance : Logger;
	
	private var m_text : Text;
	public static var events(default, null) : Events;

	private function new() 
	{
		events = new Events();
		m_text = new Text( {
			name : 'log_text',
			name_unique : true,
			text : '/ Logger / Initialized',
			pos : new Vector(10, Luxe.screen.h - 26),
			point_size : 16
		} );
	}
	
	public static function Instance() : Logger
	{
		if (m_instance == null)
		{
			m_instance = new Logger();
		}
		
		return m_instance;
	}
	
	public static function Log(msg : String)
	{
		Instance().log(msg);
	}
	
	private function log(msg : String)
	{
		m_text.text = msg;
		events.fire(Evts.EVT_LOG, msg);
	}
}
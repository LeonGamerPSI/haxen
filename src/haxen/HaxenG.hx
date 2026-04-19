package haxen;

import haxen.utils.Signal;
import raylib.Raylib.*;
import raylib.Types;

/**
 * Useful for games and stuff. Used internally too.
 */
class HaxenG
{
	/**
	 * Default Game/Window width.
	 */
	public static var defaultwidth = 800;

	/**
	 * Default Game/Window height.
	 */
	public static var defaultheight = 600;

	/**
	 * Current FrameRate. Higher values mean more power consumption, modify at your own risk!
	 */
	public static var frameRate(default, set):Int = 60;

	/**
	 * If the Engine has been  initialized.
	 */
	public static var initializedEngine:Bool = false;

	/**
	 * Dispatched before drawing.
	 */
	public static var preDraw:Signal<Void->Void> = new Signal<Void->Void>();

	/**
	 * Dispatched while drawing.
	 */
	public static var onDraw:Signal<Void->Void> = new Signal<Void->Void>();

	/**
	 * Dispatched after drawing.
	 */
	public static var postDraw:Signal<Void->Void> = new Signal<Void->Void>();

	@:noCompletion
	static function set_frameRate(value:Int):Int
	{
		frameRate = value;
		if (initializedEngine)
			SetTargetFPS(frameRate);
		return value;
	}
}

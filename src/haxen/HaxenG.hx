package haxen;

import haxen.utils.Signal;
import raylib.Raylib.*;
import raylib.Types;

/**
 * HaxenG is a static class that contains global variables and signals for the Haxen Engine. It allows you to set the default width and height of the game window, the frame rate, and the clear color. It also provides signals for pre-draw, on-draw, and post-draw events that you can use to execute code at different stages of the drawing process.
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

	/**
	 * Dispatched on update.
	 * @param deltaTime The time in seconds since the last update. You can use this to make your game frame rate independent.
	 */
	public static var onUpdate:Signal<Float->Void> = new Signal<Float->Void>();

	/**
	 * Dispatched when the engine starts. You can use this to execute code after the engine has been initialized.
	 */
	public static var onStart:Signal<Void->Void> = new Signal<Void->Void>();
	/**
	 * Dispatched when the engine stops. You can use this to execute code before the engine is closed.
	 */
	public static var onStop:Signal<Void->Void> = new Signal<Void->Void>();
	/**
	 * Clear color for the background. You can change this to set a different clear color.
	 */
	public static var clearColor:Color = BLACK;
	
	

	@:noCompletion
	static function set_frameRate(value:Int):Int
	{
		frameRate = value;
		if (initializedEngine)
			SetTargetFPS(frameRate);
		return value;
	}
}

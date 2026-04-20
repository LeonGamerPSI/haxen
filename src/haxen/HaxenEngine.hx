package haxen;

import raylib.Raylib.*;
import raylib.Types;

class HaxenEngine
{
	/**
	 * Do your initilization code first and then call this function! 
	 */
	public static function start(?width:Int = 0, ?height:Int = 0, ?title:String = 'haxen raylib ')
	{
		var screenWidth:Int = width;
		var screenHeight:Int = height;

		if (screenWidth == 0)
			screenWidth = HaxenG.defaultwidth;

		if (height == 0)
			screenHeight = HaxenG.defaultheight;

		InitWindow(screenWidth, screenHeight, title);
		InitAudioDevice();
		HaxenG.initializedEngine = true;

		HaxenG.onDraw.addCallback(() -> ClearBackground(HaxenG.clearColor));
		HaxenG.onStart.dispatch();
		// engine mainloop
		while (!WindowShouldClose())
		{

			HaxenG.preDraw.dispatch();

			BeginDrawing();
			HaxenG.onDraw.dispatch();

			EndDrawing();
			HaxenG.postDraw.dispatch();
		}
	
		HaxenG.onStop.dispatch();
		CloseAudioDevice();
		CloseWindow();
	}
}

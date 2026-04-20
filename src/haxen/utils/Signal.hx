package haxen.utils;

import haxe.Constraints.Function;

/**
 * A simple signal class that allows you to add callbacks that will be executed when the signal is dispatched. You can add callbacks that will be executed only once or every time the signal is dispatched.
 */
class Signal<T:Function>
{
	private var addOncearray:Array<T> = [];
	private var addAlwaysarray:Array<T> = [];

	/**
	 * Adds a function which will be called once and then removed on dispatch.
	 * @param void The function to execute once on dispatch.
	 */
	public function addCallbackOnce(void:T)
	{
		addOncearray.push(void);
	}

	/**
	 * Adds a function which will be called on dispatch.
	 * @param void The function to execute on dispatch.
	 */
	public function addCallback(void:T)
	{
		addAlwaysarray.push(void);
	}

	/**
	 * Dispatches callbacks and removes temporary ones added via `addCallbackOnce`.
	 * @param args Arguments that will be passed to each callback 
	 */
	public function dispatch(...args:Array<Dynamic>)
	{
		for (callback in addOncearray)
		{
			Reflect.callMethod(null, callback, args);
			addOncearray.remove(callback);
		}

		for (callback in addAlwaysarray)
		{
			Reflect.callMethod(null, callback, args);
		}
	}

	public function new()
	{
	}
}

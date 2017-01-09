/*
 * Author: commy2, Nick
 * Registers a new event handler with an object.
 *
 * Arguments:
 * 0: Event type <STRING>
 * 1: Object event handler is added to <OBJECT>
 * 2: Event code <CODE>
 *
 * Return Value:
 * Event ID <NUMBER>
 *
 * Example:
 * ["EventName",player,{systemChat "code"}] call acre_api_fnc_addEventhandler
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
	["_eventType","",[""]],
	["_object",objNull,[objNull]],
	["_eventFunc",nil,[{}]]
];
if (_eventType isEqualTo "" || _object isEqualTo objNull || isNil "_eventType") exitWith {-1};

//Use directCall to prevent race conditions
private _eventID = {
	private _eventID = _object getVariable [format [QGVAR(lastID_%1),_eventType],-1];
	_eventID = _eventID + 1;
	_object setVariable [format [QGVAR(lastID_%1),_eventType],_eventID];
	_eventID
} call CBA_fnc_directCall;

_object setVariable [format[QGVAR(%1_%2),_eventType,_eventID],_eventFunc];

_eventID
/*
 * Author: Nick
 * Removes an eventhandler from an object with a given type and ID.

 * Arguments:
 * 0: Event type <STRING>
 * 1: Object event handler is added to <OBJECT>
 * 2: Event ID <NUMBER>
 *
 * Return Value:
 * Succes or fail <BOOL>
 *
 * Example:
 * ["EventName",player,2] call acre_api_fnc_removeEventhandler
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
	["_eventType","",[""]],
	["_object",objNull,[objNull]],
	["_eventId",-1,[0]]
];
if (_eventType isEqualTo "" || _object isEqualTo objNull || _eventId < 0) exitWith {false};
private _lastID = _object getVariable [format [QGVAR(lastID_%1),_eventType],-1];
if (_eventID > _lastID) exitWith {false};

_object setVariable [format[QGVAR(%1_%2),_eventType,_eventID],nil];

true
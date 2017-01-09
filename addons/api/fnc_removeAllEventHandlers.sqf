/*
 * Author: Nick
 * Removes all event handlers from a given object of a given type.

 * Arguments:
 * 0: Event type <STRING>
 * 1: Object event handler is added to <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * ["EventName",player,2] call acre_api_fnc_removeEventhandler
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
	["_eventType","",[""]],
	["_object",objNull,[objNull]]
];
if (_eventType isEqualTo "" || _object isEqualTo objNull) exitWith {};
private _lastID = _object getVariable [format [QGVAR(lastID_%1),_eventType],-1];
for "_i" from 0 to _lastID do {
	_object setVariable [format[QGVAR(%1_%2),_eventType,_i],nil];
};
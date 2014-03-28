/*
 * Author: KoffeinFlummi
 *
 * Loads the carried/dragged unit into a vehicle for transport.
 *
 * Arguments:
 * 0: The vehicle
 *
 * Return Value:
 * -
 */

 private ["_unit", "_vehicle"];

_vehicle = _this select 0;

if isNull (player getVariable "BWA3_Carrying") then {
  _unit = player getVariable "BWA3_Dragging";
  player setVariable ["BWA3_Dragging", objNull, false];
} else {
  _unit = player getVariable "BWA3_Carrying";
  player setVariable ["BWA3_Carrying", objNull, false];
};

detach _unit;
_unit moveInCargo _vehicle;
_unit playMoveNow ((configfile >> "CfgMovesMaleSdr" >> "States" >> animationState player >> "interpolateTo") call BIS_fnc_getCfgData) select 0;

[-2, {
  _this switchMove "";
}, player] call CBA_fnc_globalExecute;
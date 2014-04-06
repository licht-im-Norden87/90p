// by commy2

private ["_weapon", "_muzzles", "_count", "_index", "_muzzle"];

_weapon = _this;
if (_weapon == "") exitWith {};

_muzzles = _weapon call BWA3_WeaponSelect_getWeaponMuzzles;

if (currentWeapon player != _weapon) exitWith {
	if (count _muzzles > 1) then {
		player selectWeapon (_muzzles select 1);
	};
};

_count = count _muzzles;
_index = (_muzzles find currentMuzzle player) + 1;
if (_index > _count - 1) then {_index = 1};

_muzzle = _muzzles select _index;

_index = 0;
while {
	currentMuzzle player != _muzzle
} do {
	player action ["SwitchWeapon", vehicle player, vehicle player, _index];
	_index = _index + 1;
};

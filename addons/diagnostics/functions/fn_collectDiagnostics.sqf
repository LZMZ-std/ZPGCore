// Collect server metrics

if (!isServer) exitWith {createHashMap};

private _players = allPlayers select {
    !(_x isKindOf "HeadlessClient_F")
};

private _ai = allUnits select {
    !isPlayer _x
};

private _scripts = diag_activeScripts;

private _data = createHashMapFromArray [
    ["fps", diag_fps],
    ["fpsMin", diag_fpsMin],
    ["uptime", time],
    ["players", count _players],
    ["ai", count _ai],
    ["groups", count allGroups],
    ["vehicles", count vehicles],
    ["scripts", _scripts]
];

missionNamespace setVariable [
    "ZPG_diagLastSnapshot",
    _data
];

_data

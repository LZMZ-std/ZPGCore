// ZPG Server Diagnostics - Initialization

if (!isServer) exitWith {};

diag_log "[ZPG DIAG] Diagnostics initializing";

missionNamespace setVariable [
    "ZPG_diagInterval",
    30
];

missionNamespace setVariable [
    "ZPG_diagEnabled",
    true
];

[] spawn ZPG_fnc_monitorDiagnostics;

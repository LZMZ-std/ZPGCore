// Background server diagnostics loop

if (!isServer) exitWith {};

diag_log "[ZPG DIAG] Monitor started";

while {
    missionNamespace getVariable [
        "ZPG_diagEnabled",
        false
    ]
} do {

    private _snapshot = call ZPG_fnc_collectDiagnostics;

    [_snapshot] call ZPG_fnc_logSnapshot;

    private _interval = missionNamespace getVariable [
        "ZPG_diagInterval",
        30
    ];

    sleep (_interval max 5);
};

diag_log "[ZPG DIAG] Monitor stopped";

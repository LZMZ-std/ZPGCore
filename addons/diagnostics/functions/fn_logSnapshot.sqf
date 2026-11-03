// Write diagnostic snapshot to RPT

params [
    ["_data", createHashMap]
];

diag_log format [
    "[ZPG DIAG] FPS: %1 | MIN: %2 | Players: %3 | AI: %4 | Groups: %5 | Vehicles: %6 | Scripts: %7 | Mission Time: %8",
    (_data getOrDefault ["fps", 0]) toFixed 1,
    (_data getOrDefault ["fpsMin", 0]) toFixed 1,
    _data getOrDefault ["players", 0],
    _data getOrDefault ["ai", 0],
    _data getOrDefault ["groups", 0],
    _data getOrDefault ["vehicles", 0],
    _data getOrDefault ["scripts", []],
    _data getOrDefault ["uptime", 0]
];

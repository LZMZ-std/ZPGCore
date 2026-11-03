class CfgPatches {
    class zpg_main {
        name = "ZPGCore";
        author = "ZPGDewTeam";

        requiredVersion = 2.00;
        requiredAddons[] = {};

        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions {
    class ZPG {
        tag = "ZPG";

        class Main {
            file = "\z\zpg\addons\main\functions";

            class postInit {
                postInit = 1;
            };
        };
    };
};
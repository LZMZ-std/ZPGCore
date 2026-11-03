class CfgPatches
{
    class zpg_diagnostics
    {
        name = "ZPG Server Diagnostics";
        author = "ZPG Team";

        requiredVersion = 2.18;
        requiredAddons[] = {};

        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions
{
    class ZPG
    {
        class Diagnostics
        {
            file = "\z\zpg\addons\diagnostics\functions";

            class postInitDiagnostics
            {
                postInit = 1;
            };

            class collectDiagnostics {};
            class monitorDiagnostics {};
            class logSnapshot {};
        };
    };
};

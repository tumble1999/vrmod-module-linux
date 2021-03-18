
#include <gmod/Interface.h>

LUA_FUNCTION(GetVersion) {
    LUA->PushNumber(20);
    return 1;
}


GMOD_MODULE_OPEN() {
    LUA->PushSpecial(GarrysMod::Lua::SPECIAL_GLOB);
    LUA->GetField(-1, "vrmod");
    if (!LUA->IsType(-1, GarrysMod::Lua::Type::TABLE)) {
        LUA->Pop(1);
        LUA->CreateTable();
    }
    LUA->PushCFunction(GetVersion);
    LUA->SetField(-2, "GetVersion");
    return 0;
}

GMOD_MODULE_CLOSE() {
    return 0;
}
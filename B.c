#include "A.h"
#include <lua.h>

int bar(void) {
    return foo();
}

int luaopen_B(lua_State* L) {
    return 0;
}

#include <lua.h>

int foo(void) {
    return 42;
}

int luaopen_A(lua_State* L) {
    return 0;
}

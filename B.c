#include <lua.h>
#include <dlfcn.h>

int (*foo)(void);

int bar(void* dl) {
    return foo();
}

int luaopen_B2(lua_State* L) {
    void* dl = *((void**)lua_touserdata(L,1));
    foo = (int (*)(void)) dlsym(dl,"foo");
    lua_pushinteger(L,bar(foo));
    return 1;
}

int luaopen_B(lua_State* L) {
    lua_pushcfunction(L,luaopen_B2);
    return 1;
}

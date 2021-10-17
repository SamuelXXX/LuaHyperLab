#include<lua.hpp>
#include<iostream>
#include"core.h"
using namespace std;

static int version(lua_State *L)
{
	lua_pushstring(L, CORE_VERSION);
	return 1;
}

static int call_func(lua_State *L)
{
	const char * func_name=lua_tostring(L,1);
	lua_getglobal(L,func_name);
	lua_replace(L,1);
	
	int params_cout=lua_gettop(L)-1;
	lua_pcall(L,params_cout,8,0);
	while(lua_isnoneornil(L,-1))
		lua_remove(L,-1);

	return lua_gettop(L);
}

static const luaL_Reg core_lib[]={
	{"version",version},
	{"call_func",call_func},
	{NULL,NULL}
};

int luaopen_core(lua_State* L)
{
	luaL_newlib(L,core_lib);
	return 1;
}
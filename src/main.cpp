#include <lua.hpp>
#include "libs/core.h"
#include <iostream>
#include <string>

using namespace std;

void run_lua_scripts(const string &lua_file_name)
{
	cout<<"LUA Virtual Machine Started......"<<endl;
	lua_State *L = luaL_newstate();

	luaL_openlibs(L);
	luaL_requiref(L, "core", luaopen_core, 1);

	luaL_dofile(L, ("../scripts/" + lua_file_name).c_str());

	lua_close(L);
	cout<<"LUA Virtual Machine Stoped......"<<endl;
}

int main()
{
	cout << "Hello World!" << endl;
	cout << endl
		 << endl;
	run_lua_scripts("main.lua");
	getchar();
	return 0;
}
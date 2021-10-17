#include<lua.hpp>
#include<iostream>
using namespace std;

static int print_welcome(lua_State *L)
{
	cout<<"Welcome to use test lua lib"<<endl;
	return 0;
}

static const luaL_Reg core_lib[]={
	{"print_welcome",print_welcome},
	{NULL,NULL}
};

int luaopen_core(lua_State* L)
{
	luaL_newlib(L,core_lib);
	return 1;
}
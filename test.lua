function compile(name)
    assert(true==os.execute('gcc -I /usr/include/luajit-2.0 -fPIC -shared -o '..name..'.so '..name..'.c'))
end

compile('A')
compile('B')

require('A')
local alib 

local reg = debug.getregistry()

for n,v in pairs(reg) do
    print(n)
    local path,name = n:match("LOADLIB: (.-)([A-Za-z0-9]+)%.so")
    if path then
        print("whee",path,name)
        if name == 'A' then
            alib = v
            break
        end
    end
end

-- foo is only defined in alib.
print(require('B')(alib))

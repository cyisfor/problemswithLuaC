function compile(name,inc)
    if inc == nil then
        inc = ''
    else
        inc = '-I'..inc
    end
    print('compile',name,inc)
    assert(true==os.execute('gcc '..inc..' -I/usr/include/luajit-2.0 -fPIC -shared -o '..name..'.so '..name..'.c'))
end

compile('A')

require('A')
local alib 
local path,name

local reg = debug.getregistry()

for n,v in pairs(reg) do
    print(n)
    path,name = n:match("LOADLIB: (.-)([A-Za-z0-9]+)%.so")
    if path then
        print("whee",path,name)
        if name == 'A' then
            alib = v
            break
        end
    end
end
compile('B',path)

-- foo is only defined in alib.
print(require('B')(alib))

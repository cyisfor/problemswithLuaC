function compile(name)
    assert(true==os.execute('gcc -I /usr/include/luajit-2.0 -fPIC -shared -o '..name..'.so '..name..'.c'))
end

compile('A')
compile('B')

require('A')
print('foo is defined now.')
require('B')

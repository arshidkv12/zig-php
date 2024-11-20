PHP_ARG_ENABLE(my_php_extension, whether to enable My PHP Extension,
[ --enable-my-php_extension   Enable My PHP Extension support])

if test "$PHP_MY_PHP_EXTENSION" != "no"; then
    PHP_REQUIRE_CXX()
    PHP_ADD_LIBRARY(stdc++, 1, MY_PHP_EXTENSION_SHARED_LIBADD)
    PHP_SUBST(MY_PHP_EXTENSION_SHARED_LIBADD)
    PHP_ADD_LIBRARY_WITH_PATH(my_php_extension, $(pwd)/zig-out/lib, MY_PHP_EXTENSION_SHARED_LIBADD)
    PHP_NEW_EXTENSION(my_php_extension, hello.c, $ext_shared)
fi

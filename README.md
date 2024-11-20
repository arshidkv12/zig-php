To build it:

1. `zig build`
2. `phpize`
3. `./configure`
4. `make`

To test it:

`php -d extension=./modules/my_php_extension.so -r "echo hello_world();"`

Should output:

`Hello from ZIG!`
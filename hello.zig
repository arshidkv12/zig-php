const std = @import("std");
const php = @cImport({
    @cInclude("php.h");
});

export fn hello_world(execute_data: ?*php.zend_execute_data, return_value: ?*php.zval) void {
    _ = execute_data;
    _ = return_value;
    _ = php.php_printf("Hello from ZIG!\n");
}

const arg_info = [_]php.zend_internal_arg_info{
    .{
        .name = null,
        .type = .{
            .type_mask = php.MAY_BE_NULL,
            .ptr = null,
        },
    },
};

export const myextension_functions = [_]php.zend_function_entry{
    php.zend_function_entry{
        .fname = "hello_world",
        .handler = hello_world,
        .arg_info = &arg_info,
        .num_args = 0,
        .flags = 0,
    },
    php.zend_function_entry{
        .fname = null,
        .handler = null,
        .arg_info = null,
        .num_args = 0,
        .flags = 0,
    },
};

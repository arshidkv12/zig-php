const std = @import("std");
const php = @cImport({
    @cInclude("php.h");
});

pub fn zval_long(z: *php.zval, l: i64) void {
    @field(z, "value").lval = l;
    @field(z, "u1").type_info = php.IS_LONG;
}

pub fn zval_copy_value(z: *php.zval, v: *php.zval) void {
    z.value = v.value;
    @field(z, "u1").type_info = @field(v, "u1").type_info;
}

export fn hello_world(execute_data: ?*php.zend_execute_data, return_value: ?*php.zval) void {
    _ = execute_data;
    _ = return_value;
    _ = php.php_printf("Hello from ZIG!\n");
}

export fn hello_world_with_args(execute_data: ?*php.zend_execute_data, return_value: ?*php.zval) void {
    var param1: [*c]const u8 = "";
    var param1_len: usize = 0;

    if (php.zend_parse_parameters(1, "s", &param1, &param1_len) == php.FAILURE) {
        _ = php.php_error_docref(null, php.E_WARNING, "Invalid arguments");
    }

    // Print the C string using php.php_printf
    _ = php.php_printf("Host: %s\n", param1);

    _ = php.php_printf("Hello with args!\n");
    _ = return_value;
    _ = execute_data;
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

const arg_info_hello_world_with_args = [_]php.zend_internal_arg_info{
    .{
        .name = "param1", // Name of the parameter
        .type = .{
            .type_mask = php.MAY_BE_STRING, // Expecting a string
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
        .fname = "hello_world_with_args",
        .handler = hello_world_with_args,
        .arg_info = &arg_info_hello_world_with_args,
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

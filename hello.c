#include "hello.h"
#ifdef HAVE_CONFIG_H
    #include "config.h"
#endif
#include "ext/standard/info.h"

PHP_MINIT_FUNCTION(my_php_extension) {
    return SUCCESS;
}

PHP_MSHUTDOWN_FUNCTION(my_php_extension) {
    return SUCCESS;
}

PHP_RINIT_FUNCTION(my_php_extension) {
    return SUCCESS;
}

PHP_RSHUTDOWN_FUNCTION(my_php_extension) {
    return SUCCESS;
}

PHP_MINFO_FUNCTION(my_php_extension) {
    php_info_print_table_start();
    php_info_print_table_header(2, "My PHP Extension", "enabled");
    php_info_print_table_end();
}

zend_module_entry my_php_extension_module_entry = {
    STANDARD_MODULE_HEADER,
    "my_php_extension",
    myextension_functions,
    PHP_MINIT(my_php_extension),
    PHP_MSHUTDOWN(my_php_extension),
    PHP_RINIT(my_php_extension),
    PHP_RSHUTDOWN(my_php_extension),
    PHP_MINFO(my_php_extension),
    PHP_MY_PHP_EXTENSION_VERSION,
    STANDARD_MODULE_PROPERTIES
};

ZEND_GET_MODULE(my_php_extension)

[opcache]
zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20090626/opcache.so
opcache.enable = {{ getenv "PHP_OPCACHE_ENABLE" "1" }}
opcache.validate_timestamps = {{ getenv "PHP_OPCACHE_VALIDATE_TIMESTAMPS" "1" }}
opcache.revalidate_freq = {{ getenv "PHP_OPCACHE_REVALIDATE_FREQ" "2" }}
opcache.max_accelerated_files = {{ getenv "PHP_OPCACHE_MAX_ACCELERATED_FILES" "4000" }}
opcache.memory_consumption = {{ getenv "PHP_OPCACHE_MEMORY_CONSUMPTION" "128" }}
opcache.interned_strings_buffer = {{ getenv "PHP_OPCACHE_INTERNED_STRINGS_BUFFER" "8" }}
opcache.fast_shutdown = {{ getenv "PHP_OPCACHE_FAST_SHUTDOWN" "1" }}
opcache.enable_cli = {{ getenv "PHP_OPCACHE_ENABLE_CLI" "1" }}
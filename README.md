# PHP Zig Extension Skeleton

This project provides a skeleton for building a PHP extension written in Zig. The goal of this project is to leverage Zig's performance and safety features within the PHP ecosystem. This guide will walk you through how to build and test the extension.

## Requirements
- **PHP**: You need a PHP installation with the ability to compile extensions (e.g., `phpize`).
- **Zig**: Install the Zig programming language from [Zig's official site](https://ziglang.org/download/).
- **GNU Make**: Required to build the extension.
- **Autotools**: Required for `phpize` and `./configure`.

### System Dependencies (Linux/macOS)
```bash
sudo apt-get install php-dev make autoconf
# Or for macOS using Homebrew
brew install autoconf make php
```

[![Watch the video](https://img.youtube.com/vi/Q2KQDQWcXZU/0.jpg)](https://youtu.be/Q2KQDQWcXZU)

## Installation Instructions
1. Clone the repository:

```
git clone https://github.com/arshidkv12/zig-php.git
cd zig-php
```

2. Install PHP development headers and dependencies, such as phpize.
3. Run the build process.

## Building the Extension

Edit build.zig file. Add correct cwd_relative php path.

To build it:

1. `zig build`
2. `phpize`
3. `./configure`
4. `make`

To test it:

`php -d extension=./modules/my_php_extension.so -r "echo hello_world();"`

Should output:

`Hello from ZIG!`

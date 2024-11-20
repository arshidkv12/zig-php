# PHP Zig Extension Skeleton

This project provides a skeleton for building a PHP extension written in Zig. The goal of this project is to leverage Zig's performance and safety features within the PHP ecosystem. This guide will walk you through how to build and test the extension.

## Table of Contents
- [Requirements](#requirements)
- [Installation Instructions](#installation-instructions)
- [Building the Extension](#building-the-extension)
- [Testing the Extension](#testing-the-extension)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

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


## Installation Instructions
Clone the repository:




To build it:

1. `zig build`
2. `phpize`
3. `./configure`
4. `make`

To test it:

`php -d extension=./modules/my_php_extension.so -r "echo hello_world();"`

Should output:

`Hello from ZIG!`
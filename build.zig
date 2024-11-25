const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const library = b.addStaticLibrary(.{
        .name = "my_php_extension",
        .root_source_file = b.path("hello.zig"),
        .target = target,
        .optimize = optimize,
    });

    library.addIncludePath(.{ .cwd_relative = "/usr/local/Cellar/php@8.2/8.2.23/include/php" });
    library.addIncludePath(.{ .cwd_relative = "/usr/local/Cellar/php@8.2/8.2.23/include/php/main" });
    library.addIncludePath(.{ .cwd_relative = "/usr/local/Cellar/php@8.2/8.2.23/include/php/TSRM" });
    library.addIncludePath(.{ .cwd_relative = "/usr/local/Cellar/php@8.2/8.2.23/include/php/Zend" });
    library.addIncludePath(.{ .cwd_relative = "/usr/local/Cellar/php@8.2/8.2.23/include" });
    //library.addIncludePath(.{
    // .path = "/usr/include/x86_64-linux-gnu"
    //});
    // library.bundle_compiler_rt = true;
    // library.linkLibC();

    b.installArtifact(library);
}

// php-config --includes

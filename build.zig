const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "my_php_extension",
        .root_module = b.createModule(.{
            .root_source_file = b.path("hello.zig"),
            .target = target,
            .optimize = optimize,
        }),
        .version = .{ .major = 1, .minor = 0, .patch = 0 },
    });

    lib.addIncludePath(.{ .cwd_relative = "/opt/homebrew/opt/php@8.4/include/php" });
    lib.addIncludePath(.{ .cwd_relative = "/opt/homebrew/opt/php@8.4/include/php/main" });
    lib.addIncludePath(.{ .cwd_relative = "/opt/homebrew/opt/php@8.4/include/php/TSRM" });
    lib.addIncludePath(.{ .cwd_relative = "/opt/homebrew/opt/php@8.4/include/php/Zend" });
    lib.addIncludePath(.{ .cwd_relative = "/opt/homebrew/opt/php@8.4/include" });

    lib.linkLibC();

    const string = b.dependency("string", .{
        .target = target,
        .optimize = optimize,
    });
    lib.root_module.addImport("string", string.module("string"));

    b.installArtifact(lib);
}

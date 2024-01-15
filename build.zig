const std = @import("std");

const pkgs = struct {
    const php = std.build.Pkg{
        .name = "php",
        .path = .{ .path = "./src/skelton.zig" },
    };
};


pub fn build(b: *std.build.Builder) void {
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});
    const lib = b.addSharedLibrary(.{
        .name = "zig-php",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = "src/skelton.zig" },
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        // .use_lld = true,
        .linkage = .dynamic,
    });

    // lib.addPackage(pkgs.php);
    lib.linkLibC();
    // lib.install();
    b.installArtifact(lib);

    // const exe = b.addExecutable("callpy", "src/callpy.zig");
    // exe.addPackage(pkgs.python);
    // exe.addIncludeDir("/usr/local/Cellar/php/8.2.8/include/php");
    // exe.linkSystemLibrary("skelton");
    // exe.linkLibC();
    // exe.install();

    // const main_tests = b.addTest("src/sum.zig");
    // // main_tests.setBuildMode(mode);

    // const test_step = b.step("test", "Run library tests");
    // test_step.dependOn(&main_tests.step);
}

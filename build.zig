const std = @import("std");

const headers = &[_][]const u8{
    "args.h",
    "chrono.h",
    "color.h",
    "compile.h",
    "core.h",
    "format-inl.h",
    "format.h",
    "os.h",
    "ostream.h",
    "printf.h",
    "ranges.h",
    "std.h",
    "xchar.h",
};

pub fn build(b: *std.Build) !void {
    var inst_step = b.getInstallStep();
    for (headers) |header| {
        const h_step = b.addInstallHeaderFile(
            std.fs.path.join(b.allocator, &.{ "include", "fmt", header }) catch @panic("OOM"),
            std.fs.path.join(b.allocator, &.{ "fmt", header }) catch @panic("OOM"),
        );
        inst_step.dependOn(&h_step.step);
    }
}

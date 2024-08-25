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
        // take headers in include/fmt and move them to the relative output header path of fmt, which should in practice be zig-out/include/fmt
        const h_step = b.addInstallHeaderFile(
            .{ .src_path = .{ .owner = b, .sub_path = b.pathJoin(&.{ "include", "fmt", header }) } },
            b.pathJoin(&.{ "fmt", header }),
        );
        inst_step.dependOn(&h_step.step);
    }
}

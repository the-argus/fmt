const std = @import("std");

pub fn build(b: *std.Build) !void {
    b.installDirectory(.{
        .source_dir = .{ .path = "include" },
        .install_dir = .header,
        .install_subdir = "",
    });
}

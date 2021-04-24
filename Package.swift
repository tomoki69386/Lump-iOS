// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Lump",
  platforms: [
    .macOS(SupportedPlatform.MacOSVersion.v11),
    .iOS(.v14),
  ],
  products: [
    .library(name: "AppFeature", targets: ["AppFeature"]),
    .library(name: "GroupListFeature", targets: ["GroupListFeature"]),
    .library(name: "GroupTimelineFeature", targets: ["GroupTimelineFeature"]),
    .library(name: "GroupCreateFeature", targets: ["GroupCreateFeature"]),
    .library(name: "SettingFeature", targets: ["SettingFeature"]),
    .library(name: "Components", targets: ["Components"]),
    .library(name: "Entity", targets: ["Entity"]),
    .library(name: "Cache", targets: ["Cache"]),
    .library(name: "CacheableImage", targets: ["CacheableImage"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .branch("iso")),
    .package(
      name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
      .exact("1.8.2"))
  ],
  targets: [
    .target(
      name: "AppFeature",
      dependencies: ["GroupListFeature", "GroupTimelineFeature", "GroupCreateFeature"]),
    .target(name: "GroupListFeature", dependencies: ["Entity"]),
    .target(name: "GroupTimelineFeature", dependencies: ["Entity", "Components"]),
    .target(name: "GroupCreateFeature", dependencies: ["Entity", "Components"]),
    .target(name: "SettingFeature"),

    .target(name: "Components", dependencies: ["Entity", "CacheableImage"]),

    .target(name: "Entity"),
    .testTarget(
      name: "EntityTests",
      dependencies: [
        .product(name: "SnapshotTesting", package: "SnapshotTesting")
      ]
    ),

    .target(name: "Cache"),
    .testTarget(
      name: "CacheTests",
      dependencies: [
        "Cache",
        .product(name: "SnapshotTesting", package: "SnapshotTesting"),
      ]
    ),

    .target(name: "CacheableImage", dependencies: ["Cache"]),
  ]
)

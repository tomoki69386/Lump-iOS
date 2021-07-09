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
    .library(name: "SettingFeature", targets: ["SettingFeature"]),
    .library(name: "GroupCreateFeature", targets: ["GroupCreateFeature"]),
    .library(name: "Component", targets: ["Component"]),
    .library(name: "Entity", targets: ["Entity"]),
    .library(name: "Cache", targets: ["Cache"]),
    .library(name: "CacheableImage", targets: ["CacheableImage"]),
    .library(name: "Styleguide", targets: ["Styleguide"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/pointfreeco/swift-composable-architecture.git", .branch("iso")),
    .package(
      name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
      .exact("1.8.2")),
  ],
  targets: [
    .target(name: "AppFeature", dependencies: ["GroupCreateFeature"]),
    .target(name: "SettingFeature"),
    .target(name: "GroupCreateFeature", dependencies: ["Entity", "Component"]),

    .target(name: "Component", dependencies: ["Entity", "CacheableImage", "Styleguide"], resources: [.process("Resources")]),
    .testTarget(
      name: "ComponentTests",
      dependencies: [
        "Component",
        .product(name: "SnapshotTesting", package: "SnapshotTesting"),
      ],
      exclude: [
        "__Snapshots__"
      ]
    ),
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
    .target(name: "Styleguide"),
  ]
)

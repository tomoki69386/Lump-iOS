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
        .library(name: "CacheableImage", targets: ["CacheableImage"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "AppFeature", dependencies: ["GroupListFeature", "GroupTimelineFeature", "GroupCreateFeature"]),
        .target(name: "GroupListFeature", dependencies: ["Entity"]),
        .target(name: "GroupTimelineFeature", dependencies: ["Entity", "Components"]),
        .target(name: "GroupCreateFeature", dependencies: ["Entity", "Components"]),
        .target(name: "SettingFeature"),
        
        .target(name: "Components", dependencies: ["Entity", "CacheableImage"]),
        
        .target(name: "Entity"),
        .testTarget(name: "EntityTests"),
        
        .target(name: "Cache"),
        .testTarget(name: "CacheTests", dependencies: ["Cache"]),
        
        .target(name: "CacheableImage", dependencies: ["Cache"])
    ]
)

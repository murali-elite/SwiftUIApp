// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIToolKits",
    platforms: [
        .iOS(.v13) // Set the minimum iOS version to 15
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UIToolKits",
            targets: ["UIToolKits"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "UIToolKits",
            resources: [
                .process("Assets.xcassets"),
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]),
        
            .testTarget(
                name: "UIToolKitsTests",
                dependencies: ["UIToolKits"],
                plugins: [
                    .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
                ]),
    ]
)

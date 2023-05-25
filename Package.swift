// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnowballSwiftKit",
    platforms: [.iOS(.v15) ],
    products: [
        .library(
            name: "SnowballSwiftKit",
            targets: ["SnowballSwiftKit"]),
        .library(
            name: "SnowballAssetKit",
            targets: ["SnowballAssetKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.51.0"),
        .package(url: "https://github.com/kean/Nuke.git", from: "12.1.0"),
        .package(url: "https://github.com/kaishin/Gifu.git", from: "3.4.0")
    ],
    targets: [
        .target(
            name: "SnowballSwiftKit",
            dependencies: [
                "Alamofire",
                "SnowballAssetKit",
                "Nuke",
                .product(name: "NukeUI", package: "Nuke"),
                "Gifu"
            ],
            plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLint")]
        ),
        .target(
            name: "SnowballAssetKit",
            resources: [.process("Resources")]
        ),
    ]
)

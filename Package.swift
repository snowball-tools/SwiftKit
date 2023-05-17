// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnowballKit",
    platforms: [.iOS(.v14),],
    products: [
        .library(
            name: "SnowballKit",
            targets: ["SnowballKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "SnowballKit",
            dependencies: [
                "Alamofire"
            ]),
    ]
)

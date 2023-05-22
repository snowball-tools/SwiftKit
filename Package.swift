// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnowballSwiftKit",
    platforms: [.iOS(.v15),],
    products: [
        .library(
            name: "SnowballSwiftKit",
            targets: ["SnowballSwiftKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "SnowballSwiftKit",
            dependencies: [
                "Alamofire"
            ]),
    ]
)

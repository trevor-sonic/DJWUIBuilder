// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DJWUIBuilder",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
        .tvOS(.v10)
    ],
    
    products: [
        .library(
            name: "DJWUIBuilder",
            targets: ["DJWUIBuilder"]),
    ],
    
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    
    targets: [
        .target(
            name: "DJWUIBuilder",
            dependencies: []),
        .testTarget(
            name: "DJWUIBuilderTests",
            dependencies: ["DJWUIBuilder"]),
    ]
)

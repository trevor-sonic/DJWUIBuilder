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
        //.package(path: "../DJWBuilderNS/"),
        //.package(url: "https://gitlab.com/trevorsonic/DJWCommon.git", from: "1.0.3"),
        .package(url: "https://gitlab.com/trevorsonic/DJWBuilderNS.git", from: "1.0.0"),
        .package(url: "https://gitlab.com/trevorsonic/DJWBindableNS.git", from: "1.0.0"),
        
//        .package(path: "../DJWBindableNS/"),
//        .package(path: "../DJWCommon/"),
        
        ///public
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
        
    ],
    
    targets: [
        .target(
            name: "DJWUIBuilder",
            
            dependencies: [
          //      "DJWCommon",
                "DJWBuilderNS",
                "DJWBindableNS",
                
                
                ///public
                "SnapKit",
            ]),
        
        
        .testTarget(
            name: "DJWUIBuilderTests",
            dependencies: ["DJWUIBuilder"]),
    ]
)

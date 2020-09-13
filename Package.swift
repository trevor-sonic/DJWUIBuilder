// swift-tools-version:5.2
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
        ///private
        .package(url: "https://gitlab.com/trevorsonic/DJWCommon.git", from: "1.0.0"),
        .package(url: "https://gitlab.com/trevorsonic/DJWBuilderNS.git", from: "1.0.0"),
        .package(url: "https://gitlab.com/trevorsonic/DJWBindableNS.git", from: "1.0.0"),
 
        ///public
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
        
    ],
    
    targets: [
        .target(
            name: "DJWUIBuilder",
            
            dependencies: [
                ///private
                "DJWCommon",
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

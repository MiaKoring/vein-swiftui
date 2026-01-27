// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "vein-swiftui",
    platforms: [.macOS(.v13), .iOS(.v16), .tvOS(.v16), .macCatalyst(.v16), .visionOS(.v1)],
    products: [
        .library(
            name: "VeinSwiftUI",
            targets: ["VeinSwiftUI", "VeinSwiftUIMacros"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/amethystsoft/Vein", branch: "main"),
        //.package(name: "Vein", path: "../Vein"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", "600.0.0" ..< "610.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        
        .target(
            name: "VeinSwiftUI",
            dependencies: [
                "VeinSwiftUIMacros",
                .byName(name: "Vein")
            ]
        ),
        .macro(
            name: "VeinSwiftUIMacros",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        .testTarget(
            name: "VeinSwiftUITests",
            dependencies: ["VeinSwiftUI"]
        ),
    ]
)

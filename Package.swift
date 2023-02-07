// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MapboxNavigation",
    defaultLocalization: "en",
    platforms: [.iOS(.v10)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MapboxCoreNavigation",
            targets: [
                "MapboxCoreNavigation",
            ]),
        .library(
            name: "MapboxNavigation",
            targets: [
                "MapboxNavigation",
            ]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Mapbox", url: "https://github.com/maplibre/maplibre-gl-native-distribution.git", from: "5.13.0"),
        .package(name: "MapboxDirections", url: "https://github.com/mapbox/mapbox-directions-swift.git", from: "1.2.0"),
        .package(name: "Solar", url: "https://github.com/ceeK/Solar.git", from: "3.0.0"),
        .package(name: "Quick", url: "https://github.com/Quick/Quick.git", from: "2.0.0"),
        .package(name: "Nimble", url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MapboxNavigation",
            dependencies: [
                "MapboxCoreNavigation",
                "Mapbox",
                "MapboxDirections",
                "Solar"
            ],
            exclude: ["Info.plist"]),
        .target(
            name: "MapboxCoreNavigation",
            dependencies: [
                "MapboxDirections",
                "MaplibrePlayground"
            ],
            exclude: ["Info.plist"]),
        .target(
            name: "MaplibrePlayground",
            dependencies: []),
        .testTarget(
            name: "MapboxCoreNavigationTests",
            dependencies: [
                "MapboxCoreNavigation",
                "Quick",
                "Nimble",
            ],
            exclude: ["Info.plist"],
            resources: [
                .process("Fixtures"),
            ]),
    ]
)


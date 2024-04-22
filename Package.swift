// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MapboxNavigation",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
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
        .package(url: "https://github.com/maplibre/maplibre-gl-native-distribution.git", exact: "6.4.0"),
        .package(url: "https://github.com/mapbox/mapbox-directions-swift.git", from: "2.9.0"),
        .package(url: "https://github.com/raphaelmor/Polyline.git", from: "5.0.2"),
        .package(url: "https://github.com/mapbox/turf-swift.git", from: "2.6.1"),
        .package(url: "https://github.com/ceeK/Solar.git", from: "3.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", from: "2.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.10.0"),
    ],
    targets: [
        // MARK: Library Targets
        .target(
            name: "MapboxNavigation",
            dependencies: [
                "MapboxCoreNavigation",
                .product(name: "MapLibre", package: "maplibre-gl-native-distribution"),
                .product(name: "MapboxDirections", package: "mapbox-directions-swift"),
                .product(name: "Solar", package: "Solar"),
                .product(name: "Turf", package: "turf-swift"),
            ],
            exclude: ["Info.plist"],
            resources: [.process("Resources")]),
        .target(
            name: "MapboxCoreNavigation",
            dependencies: [
                .product(name: "MapboxDirections", package: "mapbox-directions-swift"),
                .product(name: "Polyline", package: "Polyline"),
            ],
            exclude: ["Info.plist"]),
        
        // MARK: Test Targets
        .testTarget(
            name: "MapboxCoreNavigationTests",
            dependencies: [
                "MapboxCoreNavigation",
                "TestHelper",
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble"),
            ],
            exclude: ["Info.plist"],
            resources: [
                .process("Fixtures")
            ]),
        .testTarget(
            name: "MapboxNavigationTests",
            dependencies: [
                "MapboxNavigation",
                "TestHelper",
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            exclude: ["Info.plist"]),
        
        // MARK: Testing Support Targets
        .target(
            name: "TestHelper",
            dependencies: [
                "MapboxCoreNavigation",
                "MapboxNavigation",
                .product(name: "Turf", package: "turf-swift"),
            ],
            path: "Support/TestHelper",
            resources: [
                .process("Fixtures"),
                .process("tiles")
            ]),
    ]
)


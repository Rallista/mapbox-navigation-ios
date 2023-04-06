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
        .library(
            name: "MaplibrePlayground",
            targets: [
                "MaplibrePlayground"
            ])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/maplibre/maplibre-gl-native-distribution.git", from: "5.13.0"),
        .package(url: "https://github.com/mapbox/mapbox-directions-swift.git", from: "2.9.0"),
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
                .product(name: "Mapbox", package: "maplibre-gl-native-distribution"),
                .product(name: "MapboxDirections", package: "mapbox-directions-swift"),
                .product(name: "Solar", package: "Solar"),
            ],
            exclude: ["Info.plist"],
            resources: [
                .process("Resources")
            ]),
        .target(
            name: "MapboxCoreNavigation",
            dependencies: [
                .product(name: "MapboxDirections", package: "mapbox-directions-swift"),
                "MaplibrePlayground"
            ],
            exclude: ["Info.plist"]),
        
        // MARK: Support Targets
        .target(
            name: "MaplibrePlayground",
            dependencies: [
                .product(name: "MapboxDirections", package: "mapbox-directions-swift")
            ],
            path: "Support/MaplibrePlayground"),
        .target(
            name: "TestHelper",
            dependencies: [
                "MapboxCoreNavigation",
                "MapboxNavigation",
                "MaplibreTestPlayground",
            ],
            path: "Support/TestHelper",
            resources: [
                .process("Fixtures"),
                .process("tiles"),
                .process("GGPark-to-BernalHeights.route"),
                .process("li.tar"),
                .process("turn_left.data"),
                .process("UnionSquare-to-GGPark.route"),
            ]),
        .target(
            name: "MaplibreTestPlayground",
            dependencies: [
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble"),
            ],
            path: "Support/MaplibreTestPlayground"),
        
        // MARK: Test Targets

        
        .testTarget(
            name: "MapboxCoreNavigationTests",
            dependencies: [
                "MapboxCoreNavigation",
                "MaplibreTestPlayground",
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
            exclude: ["Info.plist"],
            resources: [
                .process("Fixtures")
            ]),
    ]
)


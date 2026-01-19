// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "SuperellipseShape",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "SuperellipseShape",
            targets: ["SuperellipseShape"]
        )
    ],
    targets: [
        .target(
            name: "SuperellipseShape",
            path: "Sources"
        ),
        .testTarget(
            name: "SuperellipseShapeTests",
            dependencies: ["SuperellipseShape"],
            path: "Tests"
        )
    ]
)

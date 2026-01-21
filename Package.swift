// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "swift-superellipse-shape",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Superellipse",
            targets: ["Superellipse"]
        )
    ],
    targets: [
        .target(
            name: "Superellipse",
            path: "Sources"
        ),
        .testTarget(
            name: "SuperellipseTests",
            dependencies: ["Superellipse"],
            path: "Tests"
        )
    ]
)

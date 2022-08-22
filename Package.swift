// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "AudioKitWebsite",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/bdrelling/DocCMiddleware", .upToNextMinor(from: "0.0.1")),
        .package(url: "https://github.com/bdrelling/PlotVapor", .upToNextMinor(from: "0.3.2")),
        .package(url: "https://github.com/JohnSundell/Plot", .upToNextMinor(from: "0.11.0")),
        .package(url: "https://github.com/vapor/vapor", from: "4.65.1"),
    ],
    targets: [
        // 💧 Vapor
        .executableTarget(
            name: "Run", 
            dependencies: [
                .target(name: "App"),
            ]
        ),
        // Targets
        .target(
            name: "App",
            dependencies: [
                .product(name: "DocCMiddleware", package: "DocCMiddleware"),
                .product(name: "Plot", package: "Plot"),
                .product(name: "PlotVapor", package: "PlotVapor"),
                .product(name: "Vapor", package: "vapor"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
    ]
)

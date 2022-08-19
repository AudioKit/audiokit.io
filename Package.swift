// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "AudioKitWebsite",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        // 💧 Vapor
        .package(url: "https://github.com/vapor/vapor", from: "4.63.0"),
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
                .product(name: "Vapor", package: "vapor")
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

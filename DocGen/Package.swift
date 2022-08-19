// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "DocCCodeGen",
//    platforms: [
//       .macOS(.v12)
//    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/AudioKit/AudioKit", from: "5.4.1"),
    ],
    targets: []
)

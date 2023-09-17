// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeMasterCLI",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CodeMasterCLI",
            targets: ["CodeMasterCLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0")
    ],
    targets: [
            .executableTarget(
                name: "CodeMasterCLI",
                dependencies: [
                    .product(name: "ArgumentParser", package: "swift-argument-parser")
                ])
        ]
)

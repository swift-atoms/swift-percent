// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-percent",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Percent",
            targets: ["Percent"]
        ),
        .library(
            name: "Percent Standard Library Integration",
            targets: ["Percent Standard Library Integration"]
        ),
        .library(
            name: "Percent Apple Foundation Integration",
            targets: ["Percent Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Percent",
            dependencies: []
        ),
        .target(
            name: "Percent Standard Library Integration",
            dependencies: ["Percent"]
        ),
        .target(
            name: "Percent Apple Foundation Integration",
            dependencies: [
                "Percent",
                "Percent Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Percent Tests",
            dependencies: [
                "Percent",
                "Percent Standard Library Integration",
                "Percent Apple Foundation Integration",
            ],
            path: "Tests/Percent Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}

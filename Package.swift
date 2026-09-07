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
        .library(name: "Percent", targets: ["Percent"]),

        .library(name: "Percent Foundation Integration", targets: ["Percent Foundation Integration"]),
        .library(name: "Percent Test Support", targets: ["Percent Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Percent",
            dependencies: [
            ],
            path: "Sources/Percent"
        ),
        
        .target(
            name: "Percent Foundation Integration",
            dependencies: [
                .target(name: "Percent"),
            ],
            path: "Sources/Percent Foundation Integration"
        ),
        .target(
            name: "Percent Test Support",
            dependencies: [
                .target(name: "Percent"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Percent Tests",
            dependencies: [
                .target(name: "Percent"),
                .target(name: "Percent Test Support"),
                .target(name: "Percent Foundation Integration"),
            ],
            path: "Tests/Percent Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}

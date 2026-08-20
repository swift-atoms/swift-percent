// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let percent: Self = "Percent"
}

extension Target.Dependency {
    static var percent: Self { .target(name: .percent) }
}

let package = Package(
    name: "swift-percent-primitives",
    products: [
        .library(
            name: .percent,
            targets: [.percent]
        )
    ],
    targets: [
        .target(
            name: .percent,
            dependencies: []
        ),
        .testTarget(
            name: "PercentTests",
            dependencies: [.percent]
        ),
    ]
)

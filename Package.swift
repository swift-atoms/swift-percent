// swift-tools-version: 6.4

import PackageDescription

extension String {
    static let percent: Self = "Percent"
}

extension Target.Dependency {
    static var percent: Self { .target(name: .percent) }
}

let package = Package(
    name: "swift-percent",
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

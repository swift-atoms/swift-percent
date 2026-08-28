# swift-percent

[![CI](https://github.com/swift-molecules/swift-percent/workflows/CI/badge.svg)](https://github.com/swift-molecules/swift-percent/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

A type-safe percentage type for Swift with arithmetic operations, comparisons, and conversions.

## Overview

swift-percent provides a `Percentage` type that represents percentage values with type safety and convenient operations. The type supports arithmetic operations, comparisons, conversions between percentages and fractions, and formatting for display.

## Features

- Type-safe percentage representation with `Percentage` struct
- Arithmetic operations: addition, subtraction, multiplication, division
- Postfix `%` operator for creating percentages: `50%`, `25.5%`
- Conversion between percentage and fraction: `50%.fraction` returns `0.5`
- Calculate percentage of values: `50%.of(200)` returns `100`
- Support for `BinaryInteger` and `BinaryFloatingPoint` types
- Comparable and Hashable conformance
- Random percentage generation within ranges
- CustomStringConvertible with locale-aware formatting
- Codable support for serialization

## Installation

Add swift-percent as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-percent.git", branch: "main")
]
```

Then add it to your target dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "Percent", package: "swift-percent")
        ]
    )
]
```

## Quick Start

```swift
import Percent

// Create percentages using postfix operator
let discount = 25%
let taxRate = 8.5%

// Perform arithmetic operations
let total = discount + taxRate      // 33.5%
let halfPercent = discount / 200%   // 12.5% (percentage of percentage)

// Calculate percentage of values
let originalPrice = 100.0
let discountAmount = discount.of(originalPrice)  // 25.0

// Compare percentages
if discount > taxRate {
    print("Discount is greater than tax rate")
}
```

## Usage

### Creating Percentages

```swift
// Using postfix operator
let p1 = 50%
let p2 = 25.5%

// Using initializers
let p3 = Percentage(75)
let p4 = Percentage(33.33)

// From fraction
let p5 = Percentage(fraction: 0.5)  // 50%

// From literals
let p6: Percentage = 50
let p7: Percentage = 25.5
```

### Arithmetic Operations

```swift
// Addition
let sum = 10% + 5.5%  // 15.5%

// Subtraction
let difference = 100% - 25%  // 75%

// Multiplication (percentage of percentage)
let product = 50% * 50%  // 25%

// Division (percentage of percentage)
let quotient = 40% / 200%  // 20%

// Negation
let negative = -10%  // -10%
```

### Calculating Percentages

```swift
// Integer values
let intResult = 50%.of(200)  // 100 (Int)

// Floating-point values
let floatResult = 50%.of(250.5)  // 125.25 (Double)

// Exact floating-point result from integer
let exactResult: Double = 50%.of(201)  // 100.5
```

### Conversions

```swift
let percentage = 50%

// Get raw percentage value
percentage.rawValue  // 50.0

// Get fraction (0.0 to 1.0)
percentage.fraction  // 0.5

// String representation
String(describing: percentage)  // "50%"
```

### Comparisons

```swift
30% > 25%   // true
50% == 50%  // true
10% < 20%   // true

// Find minimum/maximum
let min = min(25%, 75%)  // 25%
let max = max(25%, 75%)  // 75%
```

### Random Generation

```swift
// Generate random percentage in range
let random = Percentage.random(in: 10%...20%)
// Can be 10%, 11%, 12%, 19.98%, etc.
```

### Working with Different Numeric Types

```swift
// CGFloat
let cgFloat: CGFloat = 50.5
let p1 = Percentage(cgFloat)  // 50.5%

// Int
let int = 75
let p2 = Percentage(int)  // 75%

// Calculate percentage of different types
let intValue: Int = 200
let intResult = 50%.of(intValue)  // 100 (Int)

let doubleValue: Double = 200.0
let doubleResult = 50%.of(doubleValue)  // 100.0 (Double)
```

## Related Packages

### Used By

- [swift-bunq](https://github.com/swift-foundations/swift-bunq): A Swift package for the Bunq banking API.
- [swift-document-templates](https://github.com/coenttb/swift-document-templates): A Swift package for data-driven business document creation.
- [swift-money](https://github.com/swift-foundations/swift-money): A Swift package with foundational types for currency and monetary calculations.

## License

This package is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome. Please open an issue or submit a pull request.

public struct Percentage: Hashable, Codable {

    public let rawValue: Double

    public init<T>(_ percentage: T) where T: BinaryFloatingPoint {
        self.rawValue = Double(percentage)
    }

    public init<T>(_ percentage: T) where T: BinaryInteger {
        self.rawValue = Double(percentage)
    }

    public init(fraction: Double) {
        self.rawValue = fraction * 100
    }
}

extension Percentage {

    public var fraction: Double { rawValue / 100 }

    public func of<Value: BinaryInteger>(_ value: Value) -> Value {
        value * Value(rawValue.rounded()) / 100
    }

    public func of<Value: BinaryInteger, ReturnValue: BinaryFloatingPoint>(
        _ value: Value
    )
        -> ReturnValue
    {
        ReturnValue(value) * ReturnValue(rawValue) / 100
    }

    public func of<Value: BinaryFloatingPoint>(_ value: Value) -> Value {
        value * Value(rawValue) / 100
    }
}

extension Percentage {

    public static func random(in range: ClosedRange<Self>) -> Self {
        self.init(fraction: .random(in: range.lowerBound.fraction...range.upperBound.fraction))
    }
}

prefix operator -

public prefix func - (percentage: Percentage) -> Percentage {
    Percentage(-percentage.rawValue)
}

postfix operator %

public postfix func % (value: Double) -> Percentage {
    Percentage(value)
}

public postfix func % (value: Int) -> Percentage {
    Percentage(Double(value))
}

extension Percentage {

    public static func / (lhs: Self, rhs: Self) -> Self {
        self.init(fraction: lhs.fraction / rhs.fraction)
    }

    public static func /= (lhs: inout Self, rhs: Self) {
        lhs = lhs / rhs
    }
}

extension Percentage: Swift::Comparable {

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Percentage: Swift::CustomStringConvertible {

    public var description: String {
        var number = String(rawValue)
        if number.hasSuffix(".0") { number.removeLast(2) }
        return number + "%"
    }
}

extension Percentage: Swift::ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self.rawValue = value
    }
}

extension Percentage: Swift::ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Double) {
        self.rawValue = value
    }
}

extension Percentage: Swift::Numeric {

    public typealias Magnitude = Double.Magnitude

    public static var zero: Self { 0 }

    public static func + (lhs: Self, rhs: Self) -> Self {
        self.init(lhs.rawValue + rhs.rawValue)
    }

    public static func += (lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }

    public static func - (lhs: Self, rhs: Self) -> Self {
        self.init(lhs.rawValue - rhs.rawValue)
    }

    public static func -= (lhs: inout Self, rhs: Self) {
        lhs = lhs - rhs
    }

    public static func * (lhs: Self, rhs: Self) -> Self {
        self.init(fraction: lhs.fraction * rhs.fraction)
    }

    public static func *= (lhs: inout Self, rhs: Self) {
        lhs = lhs * rhs
    }

    public var magnitude: Magnitude { rawValue.magnitude }

    public init?<T>(exactly source: T) where T: BinaryInteger {
        guard let value = Double(exactly: source) else {
            return nil
        }

        self.init(value)
    }
}

extension Percentage: Swift::RawRepresentable {

    public init(rawValue: Double) {
        self.rawValue = rawValue
    }
}


public struct Percentage: Hashable, Codable {

    public let rawValue: Double

    public var fraction: Double { rawValue / 100 }

    public init<T>(_ percentage: T) where T: BinaryFloatingPoint {
        self.rawValue = Double(percentage)
    }

    public init<T>(_ percentage: T) where T: BinaryInteger {
        self.rawValue = Double(percentage)
    }

    public init(fraction: Double) {
        self.rawValue = fraction * 100
    }

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

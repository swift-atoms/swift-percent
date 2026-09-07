
extension Percentage: Swift.Numeric {

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

import Percent

extension Percentage: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

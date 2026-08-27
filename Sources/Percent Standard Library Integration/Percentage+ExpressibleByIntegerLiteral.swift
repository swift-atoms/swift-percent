import Percent

extension Percentage: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Double) {
        self.init(value)
    }
}

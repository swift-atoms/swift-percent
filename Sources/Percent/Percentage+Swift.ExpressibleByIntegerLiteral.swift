
extension Percentage: Swift.ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Double) {
        self.rawValue = value
    }
}


extension Percentage: Swift.ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self.rawValue = value
    }
}

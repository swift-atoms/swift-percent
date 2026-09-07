extension Percentage: Swift.CustomStringConvertible {
    /// A locale-independent representation of the percentage value.
    public var description: String {
        var number = String(rawValue)
        if number.hasSuffix(".0") { number.removeLast(2) }
        return number + "%"
    }
}

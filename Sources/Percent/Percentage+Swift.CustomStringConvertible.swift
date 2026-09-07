extension Percentage: Swift.CustomStringConvertible {

    public var description: String {
        var number = String(rawValue)
        if number.hasSuffix(".0") { number.removeLast(2) }
        return number + "%"
    }
}

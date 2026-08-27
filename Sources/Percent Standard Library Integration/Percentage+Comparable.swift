import Percent

extension Percentage: Comparable {

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Percentage {

    public static func random(in range: ClosedRange<Self>) -> Self {
        self.init(fraction: .random(in: range.lowerBound.fraction...range.upperBound.fraction))
    }
}

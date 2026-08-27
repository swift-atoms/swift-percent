public import Percent
public import Percent_Standard_Library_Integration
public import Foundation

extension Percentage: CustomStringConvertible {

    internal static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()

    public var description: String {
        Self.formatter.string(for: fraction) ?? "\(rawValue)%"
    }
}

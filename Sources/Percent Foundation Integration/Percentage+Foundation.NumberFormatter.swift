public import Foundation
public import Percent

extension Percentage {

    public func localizedDescription(locale: Locale = .current) -> String {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .percent
        return formatter.string(for: fraction) ?? description
    }
}

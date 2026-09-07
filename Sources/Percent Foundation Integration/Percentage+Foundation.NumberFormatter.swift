public import Foundation
public import Percent

extension Percentage {
    /// Formats the percentage using Foundation's locale-aware percent style.
    public func localizedDescription(locale: Locale = .current) -> String {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .percent
        return formatter.string(for: fraction) ?? description
    }
}

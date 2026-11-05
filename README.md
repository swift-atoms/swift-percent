# swift-percent

Use this package when a value is a percentage, such as a discount, a tax rate or a share, and you want to add, compare, scale and print it without tracking whether a `Double` holds 25 or 0.25. Start from `Percentage`. Import `Percent Foundation Integration` only when you need locale-aware formatting through `Percentage.localizedDescription(locale:)`.

## Laws

- `Percentage.rawValue` is in percentage points: `Percentage(25)`, `25%` and the literal `25` all mean 25%. Only `Percentage(fraction:)` takes a fraction, and `Percentage.fraction` is always `Percentage.rawValue / 100`.
- Values are not clamped. Negative values and values above 100% are valid.
- `+` and `-` add and subtract percentage points: 10% + 5.5% is 15.5%.
- `*` and `/` work on fractions: 50% × 50% is 25%, and 40% ÷ 200% is 20%.
- Equality, hashing and ordering follow `Percentage.rawValue`.
- `Percentage.of(_:)` scales a quantity by the fraction. When the result is floating point, the fractional part is kept: 50% of 201 is 100.5. When the result is an integer, the percentage is first rounded to whole points and the division by 100 truncates: 12.5% of 8 is 1, and 50% of 201 is 100.
- `Percentage.description` is the raw value followed by `%`, with a trailing `.0` removed: `25%`, `12.5%`, `-0.125%`.
- `Percentage.localizedDescription(locale:)` formats `Percentage.fraction` in the `NumberFormatter` percent style for the given locale, and returns `Percentage.description` if the formatter produces nothing.
- `Percentage.random(in:)` returns a value within the closed range, bounds included.

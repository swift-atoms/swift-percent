import Foundation
import Percent
import Percent_Codable_Integration
import Testing

extension Percentage {

    @Suite
    struct Serialization {

        @Suite
        struct Integration {}
    }
}

extension Percentage.Serialization.Integration {

    @Test
    func `Codable preserves the raw value keyed representation`() throws {
        let encoded = try JSONEncoder().encode(Percentage(25))
        let fields = try JSONDecoder().decode([String: Double].self, from: encoded)
        let decoded = try JSONDecoder().decode(Percentage.self, from: encoded)

        #expect(fields == ["rawValue": 25])
        #expect(decoded == Percentage(25))
    }
}

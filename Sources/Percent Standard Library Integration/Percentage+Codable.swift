import Percent

extension Percentage: Codable {

    private enum CodingKeys: String, CodingKey {
        case rawValue
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(try container.decode(Double.self, forKey: .rawValue))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rawValue, forKey: .rawValue)
    }
}

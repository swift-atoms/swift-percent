import Percent

extension Percentage: Swift.Codable {

    public init(from decoder: any Swift.Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.init(try container.decode(Double.self, forKey: .rawValue))
    }

    public func encode(to encoder: any Swift.Encoder) throws {
        var container = encoder.container(keyedBy: CodingKey.self)
        try container.encode(rawValue, forKey: .rawValue)
    }
}

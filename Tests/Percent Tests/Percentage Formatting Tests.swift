import Foundation
import Percent
import Percent_Foundation_Integration
import Testing

@Suite struct PercentageFormattingTests {
    @Test func coreDescriptionPreservesFractionalPercentages() {
        #expect(Percentage(25).description == "25%")
        #expect(Percentage(12.5).description == "12.5%")
        #expect(Percentage(-0.125).description == "-0.125%")
    }
    @Test func localizedFormattingIsAnExplicitIntegration() {
        #expect(Percentage(25).localizedDescription(locale: Locale(identifier: "en_US")) == "25%")
    }
}

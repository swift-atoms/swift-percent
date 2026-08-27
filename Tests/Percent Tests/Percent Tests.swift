import Percent_Apple_Foundation_Integration
import Percent_Standard_Library_Integration
import Testing

@testable import Percent

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

@Suite("README Verification")
struct ReadmeVerificationTests {

    @Test("Quick Start example")
    func quickStartExample() throws {

        let discount = 25%
        let taxRate = 8.5%

        let total = discount + taxRate
        let halfPercent = discount / 200%

        #expect(total.rawValue == 33.5)
        #expect(halfPercent.rawValue == 12.5)

        let originalPrice = 100.0
        let discountAmount = discount.of(originalPrice)

        #expect(discountAmount == 25.0)

        if discount > taxRate {

            #expect(discount > taxRate)
        }
    }

    @Test("Creating Percentages - Postfix operator")
    func creatingPercentagesPostfix() throws {

        let p1 = 50%
        let p2 = 25.5%

        #expect(p1.rawValue == 50)
        #expect(p2.rawValue == 25.5)
    }

    @Test("Creating Percentages - Initializers")
    func creatingPercentagesInitializers() throws {

        let p3 = Percentage(75)
        let p4 = Percentage(33.33)

        #expect(p3.rawValue == 75)
        #expect(p4.rawValue == 33.33)
    }

    @Test("Creating Percentages - From fraction")
    func creatingPercentagesFromFraction() throws {

        let p5 = Percentage(fraction: 0.5)

        #expect(p5.rawValue == 50)
    }

    @Test("Creating Percentages - From literals")
    func creatingPercentagesFromLiterals() throws {

        let p6: Percentage = 50
        let p7: Percentage = 25.5

        #expect(p6.rawValue == 50)
        #expect(p7.rawValue == 25.5)
    }

    @Test("Arithmetic - Addition")
    func arithmeticAddition() throws {

        let sum = 10% + 5.5%

        #expect(sum.rawValue == 15.5)
    }

    @Test("Arithmetic - Subtraction")
    func arithmeticSubtraction() throws {

        let difference = 100% - 25%

        #expect(difference.rawValue == 75)
    }

    @Test("Arithmetic - Multiplication")
    func arithmeticMultiplication() throws {

        let product = 50% * 50%

        #expect(product.rawValue == 25)
    }

    @Test("Arithmetic - Division")
    func arithmeticDivision() throws {

        let quotient = 40% / 200%

        #expect(quotient.rawValue == 20)
    }

    @Test("Arithmetic - Negation")
    func arithmeticNegation() throws {

        let negative = -10%

        #expect(negative.rawValue == -10)
    }

    @Test("Calculating Percentages - Integer values")
    func calculatingPercentagesInteger() throws {

        let intResult = 50%.of(200)

        #expect(intResult == 100)
    }

    @Test("Calculating Percentages - Floating-point values")
    func calculatingPercentagesFloatingPoint() throws {

        let floatResult = 50%.of(250.5)

        #expect(floatResult == 125.25)
    }

    @Test("Calculating Percentages - Exact floating-point result")
    func calculatingPercentagesExact() throws {

        let exactResult: Double = 50%.of(201)

        #expect(exactResult == 100.5)
    }

    @Test("Conversions")
    func conversions() throws {
        let percentage = 50%

        #expect(percentage.rawValue == 50.0)

        #expect(percentage.fraction == 0.5)

        let stringRep = String(describing: percentage)
        #expect(stringRep == "50%")
    }

    @Test("Comparisons")
    func comparisons() throws {
        #expect(30% > 25%)
        #expect(50% == 50%)
        #expect(10% < 20%)

        let minVal = min(25%, 75%)
        let maxVal = max(25%, 75%)

        #expect(minVal.rawValue == 25)
        #expect(maxVal.rawValue == 75)
    }

    @Test("Random Generation")
    func randomGeneration() throws {

        let random = Percentage.random(in: 10% ... 20%)

        #expect(random >= 10%)
        #expect(random <= 20%)
    }

    #if canImport(CoreGraphics)
        @Test("Working with Different Numeric Types - CGFloat")
        func workingWithCGFloat() throws {

            let cgFloat: CGFloat = 50.5
            let p1 = Percentage(cgFloat)

            #expect(p1.rawValue == 50.5)
        }
    #endif

    @Test("Working with Different Numeric Types - Int")
    func workingWithInt() throws {

        let int = 75
        let p2 = Percentage(int)

        #expect(p2.rawValue == 75)
    }

    @Test("Working with Different Numeric Types - Calculate percentages")
    func workingWithDifferentTypes() throws {

        let intValue: Int = 200
        let intResult = 50%.of(intValue)

        #expect(intResult == 100)

        let doubleValue: Double = 200.0
        let doubleResult = 50%.of(doubleValue)

        #expect(doubleResult == 100.0)
    }
}

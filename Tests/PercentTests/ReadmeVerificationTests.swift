import Testing

@testable import Percent

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

@Suite("README Verification")
struct ReadmeVerificationTests {

    @Test("Quick Start example from README line 50-69")
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

    @Test("Creating Percentages - Postfix operator from README line 76-78")
    func creatingPercentagesPostfix() throws {

        let p1 = 50%
        let p2 = 25.5%

        #expect(p1.rawValue == 50)
        #expect(p2.rawValue == 25.5)
    }

    @Test("Creating Percentages - Initializers from README line 80-82")
    func creatingPercentagesInitializers() throws {

        let p3 = Percentage(75)
        let p4 = Percentage(33.33)

        #expect(p3.rawValue == 75)
        #expect(p4.rawValue == 33.33)
    }

    @Test("Creating Percentages - From fraction from README line 84-85")
    func creatingPercentagesFromFraction() throws {

        let p5 = Percentage(fraction: 0.5)

        #expect(p5.rawValue == 50)
    }

    @Test("Creating Percentages - From literals from README line 87-89")
    func creatingPercentagesFromLiterals() throws {

        let p6: Percentage = 50
        let p7: Percentage = 25.5

        #expect(p6.rawValue == 50)
        #expect(p7.rawValue == 25.5)
    }

    @Test("Arithmetic - Addition from README line 95-96")
    func arithmeticAddition() throws {

        let sum = 10% + 5.5%

        #expect(sum.rawValue == 15.5)
    }

    @Test("Arithmetic - Subtraction from README line 98-99")
    func arithmeticSubtraction() throws {

        let difference = 100% - 25%

        #expect(difference.rawValue == 75)
    }

    @Test("Arithmetic - Multiplication from README line 101-102")
    func arithmeticMultiplication() throws {

        let product = 50% * 50%

        #expect(product.rawValue == 25)
    }

    @Test("Arithmetic - Division from README line 104-105")
    func arithmeticDivision() throws {

        let quotient = 40% / 200%

        #expect(quotient.rawValue == 20)
    }

    @Test("Arithmetic - Negation from README line 107-108")
    func arithmeticNegation() throws {

        let negative = -10%

        #expect(negative.rawValue == -10)
    }

    @Test("Calculating Percentages - Integer values from README line 114-115")
    func calculatingPercentagesInteger() throws {

        let intResult = 50%.of(200)

        #expect(intResult == 100)
    }

    @Test("Calculating Percentages - Floating-point values from README line 117-118")
    func calculatingPercentagesFloatingPoint() throws {

        let floatResult = 50%.of(250.5)

        #expect(floatResult == 125.25)
    }

    @Test("Calculating Percentages - Exact floating-point result from README line 120-121")
    func calculatingPercentagesExact() throws {

        let exactResult: Double = 50%.of(201)

        #expect(exactResult == 100.5)
    }

    @Test("Conversions from README line 126-136")
    func conversions() throws {
        let percentage = 50%

        #expect(percentage.rawValue == 50.0)

        #expect(percentage.fraction == 0.5)

        let stringRep = String(describing: percentage)
        #expect(stringRep == "50%")
    }

    @Test("Comparisons from README line 141-148")
    func comparisons() throws {
        #expect(30% > 25%)
        #expect(50% == 50%)
        #expect(10% < 20%)

        let minVal = min(25%, 75%)
        let maxVal = max(25%, 75%)

        #expect(minVal.rawValue == 25)
        #expect(maxVal.rawValue == 75)
    }

    @Test("Random Generation from README line 154-156")
    func randomGeneration() throws {

        let random = Percentage.random(in: 10% ... 20%)

        #expect(random >= 10%)
        #expect(random <= 20%)
    }

    #if canImport(CoreGraphics)
        @Test("Working with Different Numeric Types - CGFloat from README line 162-164")
        func workingWithCGFloat() throws {

            let cgFloat: CGFloat = 50.5
            let p1 = Percentage(cgFloat)

            #expect(p1.rawValue == 50.5)
        }
    #endif

    @Test("Working with Different Numeric Types - Int from README line 166-168")
    func workingWithInt() throws {

        let int = 75
        let p2 = Percentage(int)

        #expect(p2.rawValue == 75)
    }

    @Test("Working with Different Numeric Types - Calculate percentages from README line 170-175")
    func workingWithDifferentTypes() throws {

        let intValue: Int = 200
        let intResult = 50%.of(intValue)

        #expect(intResult == 100)

        let doubleValue: Double = 200.0
        let doubleResult = 50%.of(doubleValue)

        #expect(doubleResult == 100.0)
    }
}

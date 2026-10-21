import Testing

@testable import Percent

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

@Suite
struct `Percentages support construction arithmetic conversion and ordering` {

    @Test
    func `Discounts combine and apply to a price`() throws {

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

    @Test
    func `Postfix operators create whole and fractional percentages`() throws {

        let p1 = 50%
        let p2 = 25.5%

        #expect(p1.rawValue == 50)
        #expect(p2.rawValue == 25.5)
    }

    @Test
    func `Initializers preserve whole and fractional percentage values`() throws {

        let p3 = Percentage(75)
        let p4 = Percentage(33.33)

        #expect(p3.rawValue == 75)
        #expect(p4.rawValue == 33.33)
    }

    @Test
    func `Fraction initializers scale the fraction by one hundred`() throws {

        let p5 = Percentage(fraction: 0.5)

        #expect(p5.rawValue == 50)
    }

    @Test
    func `Integer and floating point literals preserve percentage values`() throws {

        let p6: Percentage = 50
        let p7: Percentage = 25.5

        #expect(p6.rawValue == 50)
        #expect(p7.rawValue == 25.5)
    }

    @Test
    func `Addition combines percentage values`() throws {

        let sum = 10% + 5.5%

        #expect(sum.rawValue == 15.5)
    }

    @Test
    func `Subtraction computes the difference between percentage values`() throws {

        let difference = 100% - 25%

        #expect(difference.rawValue == 75)
    }

    @Test
    func `Multiplication scales one percentage by another`() throws {

        let product = 50% * 50%

        #expect(product.rawValue == 25)
    }

    @Test
    func `Division computes the quotient of percentage values`() throws {

        let quotient = 40% / 200%

        #expect(quotient.rawValue == 20)
    }

    @Test
    func `Negation reverses the sign of a percentage`() throws {

        let negative = -10%

        #expect(negative.rawValue == -10)
    }

    @Test
    func `Percentages scale integer quantities`() throws {

        let intResult = 50%.of(200)

        #expect(intResult == 100)
    }

    @Test
    func `Percentages scale floating point quantities`() throws {

        let floatResult = 50%.of(250.5)

        #expect(floatResult == 125.25)
    }

    @Test
    func `Floating point results preserve fractional parts of integer quantities`() throws {

        let exactResult: Double = 50%.of(201)

        #expect(exactResult == 100.5)
    }

    @Test
    func `Raw values fractions and descriptions represent the same percentage`() throws {
        let percentage = 50%

        #expect(percentage.rawValue == 50.0)

        #expect(percentage.fraction == 0.5)

        let stringRep = String(describing: percentage)
        #expect(stringRep == "50%")
    }

    @Test
    func `Ordering selects the minimum and maximum percentages`() throws {
        #expect(30% > 25%)
        #expect(50% == 50%)
        #expect(10% < 20%)

        let minVal = min(25%, 75%)
        let maxVal = max(25%, 75%)

        #expect(minVal.rawValue == 25)
        #expect(maxVal.rawValue == 75)
    }

    @Test
    func `Random percentages stay inside the requested range`() throws {

        let random = Percentage.random(in: 10% ... 20%)

        #expect(random >= 10%)
        #expect(random <= 20%)
    }

    #if canImport(CoreGraphics)
        @Test
        func `Core Graphics values preserve fractional percentages`() throws {

            let cgFloat: CGFloat = 50.5
            let p1 = Percentage(cgFloat)

            #expect(p1.rawValue == 50.5)
        }
    #endif

    @Test
    func `Integer values initialize percentages without scaling`() throws {

        let int = 75
        let p2 = Percentage(int)

        #expect(p2.rawValue == 75)
    }

    @Test
    func `Percentages scale integer and floating point quantities consistently`() throws {

        let intValue: Int = 200
        let intResult = 50%.of(intValue)

        #expect(intResult == 100)

        let doubleValue: Double = 200.0
        let doubleResult = 50%.of(doubleValue)

        #expect(doubleResult == 100.0)
    }
}

import Foundation
import XCTest

/*
 Practice challenge 1: Sum an array of numbers
 Difficulty: Fun
 Write one function that sums an array of numbers. For an easy solution make it work with just integers, but for a little more challenge make it work with an array of integers or an array of doubles.
 */

class TestClass: XCTestCase {
    func sum<T: Numeric>(_ numbers: [T]) -> T {
        // Simple solution using for loop
        /*
         var total = 0
         for number in numbers {
         total += number
         }
         return total
         */
        
        // Functional solution
        numbers.reduce(0, +)
        
        // Both solutions have the same time O(n) and space O(1) complexity
    }
    
    func testSumInts() {
        let ints = sum([1, 2, 3])
        XCTAssertEqual(ints, 6)
    }
    
    func testSumDoubles() {
        let doubles = sum([1.0, 2.0, 3.0])
        XCTAssertEqual(doubles, 6.0)
    }
    
    func testSumContainingDuplicates() {
        let containsDuplicates = sum([1,2,2,10,10])
        XCTAssertEqual(containsDuplicates, 25)
        
    }
    
    func testSumContainingNegativesWithPositiveResult() {
        let containsNegativesPositiveResult = sum([-3,5,-2,7])
        XCTAssertEqual(containsNegativesPositiveResult, 7)
        
    }
    
    func testSumContainingNegativesWithNegativeResult() {
        let containsNegativesNegativeResult = sum([-3,5,-6,1])
        XCTAssertEqual(containsNegativesNegativeResult, -3)
    }
}

TestClass.defaultTestSuite.run()

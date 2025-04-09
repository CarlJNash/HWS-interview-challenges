import Foundation
import XCTest

/*
 “Write a function that accepts a string, and returns how many times a specific character appears, taking case into account.
 */

class TestClass: XCTestCase {
    func count(letter: Character, in input: String) -> Int {
        // HWS solution 1
        //    var total = 0
        //    for char in input {
        //        if char == letter { total += 1 }
        //    }
        //    return total
        
        // HWS solution 2
        //    input.reduce(0) { $1 == letter ? $0 + 1 : $0 }
        
        // or more verbosely
        //    input.reduce(0) { count, inputChar in
        //        inputChar == letter ? (count + 1) : count
        //    }
        
        // My solution
        input.filter { $0 == letter }.count
        
        // All solutions have a O(n) complexity as they all iterate over each character in the input string, so n is the length of the string
    }
    
    func testCount1() {
        let count = count(letter: "a", in: "The rain in Spain")
        XCTAssertEqual(count, 2)
    }
    
    func testCount2() {
        let count = count(letter: "i", in: "Mississippi")
        XCTAssertEqual(count, 4)
    }
    
    func testCount3() {
        let count = count(letter: "i", in: "Hacking with Swift")
        XCTAssertEqual(count, 3)
    }
    
    func testCountCaseSensitive() {
        let count = count(letter: "a", in: "A string with lowercase a and uppercase A")
        XCTAssertEqual(count, 4)
    }
}

TestClass.defaultTestSuite.run()

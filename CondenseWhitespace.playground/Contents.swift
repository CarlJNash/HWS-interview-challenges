import Foundation
import XCTest

/*
 Write a function that accepts a String, and return it with any consecutive spaces replaced with a single space.
 */
func condenseWhitespace(in input: String) -> String {
    // mine
//    input.replacing(try! Regex("[\\s]{2,}"), with: " ")
    // HWS
    input.replacing(/\ +/, with: " ")
}

class TestCase: XCTestCase {
    func testCondenseWhitespace() {
        XCTAssertEqual(condenseWhitespace(in: "a   b   c"), "a b c")
        XCTAssertEqual(condenseWhitespace(in: "    a"), " a")
        XCTAssertEqual(condenseWhitespace(in: "abc"), "abc")
    }
}

TestCase.defaultTestSuite.run()

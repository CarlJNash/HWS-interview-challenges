import Foundation
import XCTest

/*
 Write a function that accepts a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case.
 */
func isPalindrome(string: String) -> Bool {
    let lowercased = string.lowercased()
    return String(lowercased.reversed()) == lowercased
}

class TestCase: XCTestCase {
    func testIsPalindrome() {
        XCTAssertTrue(isPalindrome(string: "rotator"))
        XCTAssertTrue(isPalindrome(string: "Rats live on no evil star"))
        XCTAssertFalse(isPalindrome(string: "Never odd or even"))
        XCTAssertFalse(isPalindrome(string: "Hello, world"))
    }
}

TestCase.defaultTestSuite.run()

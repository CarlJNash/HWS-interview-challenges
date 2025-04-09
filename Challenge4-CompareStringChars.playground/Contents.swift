import Foundation
import XCTest

/*
 “Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.
 */

class TestClass: XCTestCase {
    func areCharactersIdentical(in input1: String, and input2: String) -> Bool {
        input1.sorted() == input2.sorted()
    }
    
    func testAreCharactersIdentical() {
        XCTAssertTrue(areCharactersIdentical(in: "abca", and: "abca"))
        XCTAssertTrue(areCharactersIdentical(in: "abc", and: "cba"))
        XCTAssertTrue(areCharactersIdentical(in: "a1 b2", and: "b1 a2"))

        XCTAssertFalse(areCharactersIdentical(in: "abc", and: "abca"))
        XCTAssertFalse(areCharactersIdentical(in: "abcc", and: "abca"))
        XCTAssertFalse(areCharactersIdentical(in: "abc", and: "Abc"))
    }
}

TestClass.defaultTestSuite.run()

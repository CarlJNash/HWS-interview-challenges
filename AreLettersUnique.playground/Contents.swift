import Foundation
import XCTest

func lettersAreUnique(in input: String) -> Bool {
    Set(input).count == input.count
}

func uniqueOccurrences(in input: String) -> Bool {
    var occurences: [Character : Int] = [:]
    // Get the count of each character in the string
    for char in input {
        occurences[char, default: 0] += 1
    }
    // Return true if the number of unique values matches the number of values, otherwise return false
    return Set(occurences.values).count == occurences.values.count
}

class TestCase: XCTestCase {
    func testNoDuplicates() {
        XCTAssertTrue(lettersAreUnique(in: "No duplicates"))
    }

    func testAlphabet() {
        XCTAssertTrue(lettersAreUnique(in: "abcdefghijklmnopqrstuvwxyz"))
    }

    func testABCCaseSensitive() {
        XCTAssertTrue(lettersAreUnique(in: "AaBbCc"))
    }

    func testNotUnique() {
        XCTAssertFalse(lettersAreUnique(in: "Hello, World"))
    }

    func testUniqueOccurences() {
        XCTAssertTrue(uniqueOccurrences(in: "ABBCCCDDDD"))
        XCTAssertTrue(uniqueOccurrences(in: "AABACCCABD"))
        XCTAssertFalse(uniqueOccurrences(in: "HELLO"))
        XCTAssertFalse(uniqueOccurrences(in: "HeLlO"))
    }
}

TestCase.defaultTestSuite.run()

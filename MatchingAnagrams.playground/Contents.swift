import Foundation
import XCTest

/*
 Create a function that accepts two strings, and returns true if the first string is an anagram of the second.
 */
func isAnagram(_ first: String, for second: String) -> Bool {
    // simple solution but less efficient
    // time complexity: O(n log n) for sorting 2 strings
    // space complexity: O(n) for allocating 2 arrays for the sorted arrays
//    first.sorted() == second.sorted()

    // longer solution but more efficient
    // time complexity: O(n)
    // space complexity: O(n)
    var counts = [Character: Int]()
    for letter in first {
        counts[letter, default: 0] += 1
    }
    for letter in second {
        counts[letter, default: 0] -= 1
    }
    return counts.values.allSatisfy { $0 == 0 }
}

class TestClass: XCTestCase {
    func testIsAnagram() {
        XCTAssertTrue(isAnagram("stone", for: "tones"))
        XCTAssertTrue(isAnagram("madam", for: "madam"))
        XCTAssertFalse(isAnagram("Madam", for: "madam"))
        XCTAssertFalse(isAnagram("hello", for: "world"))
    }
}

TestClass.defaultTestSuite.run()

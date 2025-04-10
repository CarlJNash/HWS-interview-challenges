import Foundation
import XCTest

/*
 Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.
 */
func lettersAreUnique(in input: String) -> Bool {
    Set(input).count == input.count
}

/*
 A common variation of the "Are the letters unique?" challenge is to check whether the letter occurrences are unique:
 when you count all the occurrences of each letter, is each count unique?
 */
func uniqueOccurrences(in input: String) -> Bool {
    var occurences: [Character : Int] = [:]
    // Get the count of each character in the string
    for char in input {
        occurences[char, default: 0] += 1
    }
    // Return true if the number of unique values matches the number of values, otherwise return false
    return Set(occurences.values).count == occurences.values.count
}

/*
 Write a function that accepts two strings, a needle string and a haystack string.
 The function should return how often characters from the needle string occur in the haystack string.
 Each character will appear only once in the needle string, and your check should be case-sensitive.
 */
func count(needles: String, in haystack: String) -> Int {
    // Convert `needles` to a Set to remove duplicates
    // Return the number of times a char from `needles` exists in `haystack`
    // This has a time complexity of O(m + n) and a space complexity of O(n)
    // The time complexity is based on the number of characters in needles + haystack - which is why the benefit from making needles a Set and removing duplicates
    // The space complexity is the based on the space needed for holding Set(needles)
    haystack.count(where: { Set(needles).contains($0) })
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

    func testNeedlesInHaystack() {
        XCTAssertEqual(count(needles: "Aa", in: "ABACA"), 3)
        XCTAssertEqual(count(needles: "AAa", in: "ABACA"), 3)
        XCTAssertEqual(count(needles: "abc", in: "abcabc"), 6)
        XCTAssertEqual(count(needles: "a", in: "AAA"), 0)
    }
}

TestCase.defaultTestSuite.run()

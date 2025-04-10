import Foundation
import XCTest

/*
 Write a function that accepts a string as its input and returns the same string with duplicate letters removed, so that each letter appears only once.
 Tip: If you can solve this challenge without a for-in loop, you can consider it a Tricky difficulty rather than Fun.
 */
func removeDuplicateCharacters(in string: String) -> String {
    var used = Set<Character>()
    return string.filter {
        // only return the Character if it's not inserted into the Set
        used.insert($0).inserted
    }
}

class TestCase: XCTestCase {
    func testRemoveDuplicates() {
        XCTAssertEqual(removeDuplicateCharacters(in: "wombat"), "wombat")
        XCTAssertEqual(removeDuplicateCharacters(in: "hello"), "helo")
        XCTAssertEqual(removeDuplicateCharacters(in: "Mississippi"), "Misp")
    }
}

TestCase.defaultTestSuite.run()

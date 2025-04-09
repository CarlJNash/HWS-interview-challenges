import Foundation
import XCTest

/*
 Create a function that accepts an array of strings, and returns them sorted with the longest first.
 */

class TestClass: XCTestCase {
    func sortByLength(_ array: [String]) -> [String] {
//        array.sorted() // this sorts alphabetically so no good
        array.sorted { $0.count > $1.count }
    }

    func testSortByLength() {
        let one = sortByLength(["a", "abc", "ab"])
        let two = sortByLength(["paul", "taylor", "adele"])
        let three = sortByLength([])
        
        XCTAssert(one == ["abc", "ab", "a"])
        XCTAssert(two == ["taylor", "adele", "paul"])
        XCTAssert(three == [])
    }
}

TestClass.defaultTestSuite.run()

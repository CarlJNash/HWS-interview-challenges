import Foundation
import XCTest

/*
 “Write an extension for all collections of Comparable objects that returns the n smallest elements as an array, sorted smallest first.”
 */

extension Collection where Element: Comparable {
    func smallest(_ value: Int) -> [Element] {
        Array(self.sorted().prefix(value))
    }
}

class TestCase: XCTestCase {
    func testSmallest() {
        XCTAssert([1, 2, 3, 4].smallest(3) == [1, 2, 3])
        XCTAssert(["q", "f", "k"].smallest(3) == ["f", "k", "q"])
        XCTAssert([256, 16].smallest(3) == [16, 256])
        XCTAssert([String]().smallest(3) == [])
    }
}

TestCase.defaultTestSuite.run()

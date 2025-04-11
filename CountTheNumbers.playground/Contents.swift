import Foundation
import XCTest

/*
 Write a function that accepts an array of integers and returns the number of times a specific digit appears in any of its numbers.
 */
func countForLoop(_ input: Character, in numbers: [Int]) -> Int {
    var occurences = 0
    for number in numbers {
        let numberString = String(number)
        for char in numberString where char == input {
            occurences += 1
        }
    }
    return occurences
}

func countFunctional(_ input: Character, in numbers: [Int]) -> Int {
    var occurences = 0
    numbers
        .map { String($0) }
        .forEach {
            occurences += $0.count(where: { $0 == input })
        }

    return occurences
}

func countHWS(_ input: Character, in numbers: [Int]) -> Int {
    numbers.reduce(0) { total, next in
        total + String(next).count(where: { $0 == input })
    }
}

class TestCase: XCTestCase {
    func testCountForLoop() {
        XCTAssertEqual(countForLoop("5", in: [5, 15, 55, 515]), 6)
        XCTAssertEqual(countForLoop("1", in: [5, 15, 55, 515]), 2)
        XCTAssertEqual(countForLoop("5", in: [55555]), 5)
        XCTAssertEqual(countForLoop("1", in: [55555]), 0)
    }
    func testCountFunctional() {
        XCTAssertEqual(countFunctional("5", in: [5, 15, 55, 515]), 6)
        XCTAssertEqual(countFunctional("1", in: [5, 15, 55, 515]), 2)
        XCTAssertEqual(countFunctional("5", in: [55555]), 5)
        XCTAssertEqual(countFunctional("1", in: [55555]), 0)
    }
    func testCountHWS() {
        XCTAssertEqual(countHWS("5", in: [5, 15, 55, 515]), 6)
        XCTAssertEqual(countHWS("1", in: [5, 15, 55, 515]), 2)
        XCTAssertEqual(countHWS("5", in: [55555]), 5)
        XCTAssertEqual(countHWS("1", in: [55555]), 0)
    }
}

TestCase.defaultTestSuite.run()

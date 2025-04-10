import Foundation
import XCTest

func fizzBuzzMine(_ value: UInt) -> String {
    var returnValues = [String]()
    if value % 3 == 0 { returnValues.append("Fizz") }
    if value % 5 == 0 { returnValues.append("Buzz") }
    if returnValues.isEmpty { returnValues.append("\(value)") }
    return returnValues.joined(separator: " ")
}

func fizzBuzz(_ input: UInt) -> String {
    switch (input.isMultiple(of: 3), input.isMultiple(of: 5)) {
    case (true, true): "Fizz Buzz"
    case (true, false): "Fizz"
    case (false, true): "Buzz"
    case (false, false): String(input)
    }
}

class TestCase: XCTestCase {
    func testFizzBuzz1() {
        XCTAssert(fizzBuzz(1) == "1")
    }
    func testFizzBuzz2() {
        XCTAssert(fizzBuzz(2) == "2")
    }
    func testFizzBuzz3() {
        XCTAssert(fizzBuzz(3) == "Fizz")
    }
    func testFizzBuzz4() {
        XCTAssert(fizzBuzz(4) == "4")
    }
    func testFizzBuzz5() {
        XCTAssert(fizzBuzz(5) == "Buzz")
    }
    func testFizzBuzz15() {
        XCTAssert(fizzBuzz(15) == "Fizz Buzz")
    }
}

TestCase.defaultTestSuite.run()

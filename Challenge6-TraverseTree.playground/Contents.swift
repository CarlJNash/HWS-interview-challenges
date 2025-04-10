import Foundation
import XCTest

/*
 Write a new method for a binary tree that traverses the tree in order, running a function on each node.
 Tip: You should use the binary tree implementation we covered already, which is repeated in the test case code below.
 Traversing a node in order means visiting its left value, then visiting its own value, then visiting its right value.
 */

class Node<Value> {
    var value: Value
    var left: Node?
    var right: Node?
    
    init(_ value: Value) {
        self.value = value
    }
    
    func traverse(_ function: (Node<Value>) -> Void) {
        left?.traverse(function)
        function(self)
        right?.traverse(function)
    }
}

class TestCase: XCTestCase {
    
    func testTraverse3Nodes() {
        let tree = Node(2)
        tree.left = Node(1)
        tree.right = Node(3)

        var values = [Int]()
        tree.traverse { values.append($0.value) }
        XCTAssertEqual(values, [1, 2, 3])

        var sum = 0
        tree.traverse { sum += $0.value }
        XCTAssertEqual(sum, 6)
    }

    func testTraverse5Nodes() {
        let tree = Node(2)
        tree.left = Node(1)
        let three = Node(3)
        three.right = Node(4)
        tree.right = three

        var values = [Int]()
        tree.traverse { values.append($0.value) }
        XCTAssertEqual(values, [1, 2, 3, 4])

        var sum = 0
        tree.traverse { sum += $0.value }
        XCTAssertEqual(sum, 10)
    }
}

TestCase.defaultTestSuite.run()

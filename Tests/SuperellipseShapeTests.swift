import SwiftUI
import XCTest
@testable import SuperellipseShape

final class SuperellipseShapeTests: XCTestCase {
    func testMinimumStepsAreEnforced() {
        let shape = SuperellipseShape(n: 3, steps: 2)
        XCTAssertEqual(shape.steps, 32)
    }

    func testAnimatableDataRoundTrips() {
        var shape = SuperellipseShape()
        shape.animatableData = 2.5
        XCTAssertEqual(shape.n, 2.5)
    }

    func testPathGeneratesExpectedSegments() {
        let steps = 64
        let shape = SuperellipseShape(n: 4.5, steps: steps)
        let path = shape.path(in: CGRect(x: 0, y: 0, width: 100, height: 60))

        var moves = 0
        var lines = 0
        var closes = 0

        path.forEach { element in
            switch element {
            case .move:
                moves += 1
            case .line:
                lines += 1
            case .closeSubpath:
                closes += 1
            case .curve, .quadCurve:
                break
            }
        }

        XCTAssertEqual(moves, 1)
        XCTAssertEqual(lines, steps)
        XCTAssertEqual(closes, 1)
    }
}

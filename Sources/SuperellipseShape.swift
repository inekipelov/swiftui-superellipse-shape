//
//  SuperellipseShape.swift
//

import SwiftUI

/// Shape based on the superellipse equation: |x/a|^n + |y/b|^n = 1
public struct SuperellipseShape: Shape {
    /// Controls curvature.
    /// n = 2 -> ellipse
    /// higher n -> more "squarish"
    public var n: CGFloat
    public var steps: Int

    public init(n: CGFloat = 4.5, steps: Int = 256) {
        self.n = n
        self.steps = max(32, steps)
    }

    public var animatableData: CGFloat {
        get { n }
        set { n = newValue }
    }

    public func path(in rect: CGRect) -> Path {
        let n = max(n, 0.01)
        let a = rect.width / 2
        let b = rect.height / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)

        var path = Path()
        path.move(to: point(at: 0, a: a, b: b, n: n, center: center))

        for i in 1...steps {
            let t = 2 * CGFloat.pi * CGFloat(i) / CGFloat(steps)
            path.addLine(to: point(at: t, a: a, b: b, n: n, center: center))
        }

        path.closeSubpath()
        return path
    }
}

private extension SuperellipseShape {
    func point(at t: CGFloat, a: CGFloat, b: CGFloat, n: CGFloat, center: CGPoint) -> CGPoint {
        let c = cos(t)
        let s = sin(t)

        let x = pow(abs(c), 2 / n) * a * (c >= 0 ? 1 : -1)
        let y = pow(abs(s), 2 / n) * b * (s >= 0 ? 1 : -1)

        return CGPoint(x: center.x + x, y: center.y + y)
    }
}

// MARK: - Syntactic sugar

public extension Shape where Self == SuperellipseShape {
    static var superellipse: SuperellipseShape { .init() }
    static func superellipse(n: CGFloat, steps: Int = 256) -> SuperellipseShape {
        .init(n: n, steps: steps)
    }
}

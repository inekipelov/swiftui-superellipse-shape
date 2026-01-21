#if swift(>=5.9)
import SwiftUI

struct SuperellipsePlayground: View {
    @State private var curvature: CGFloat = 4.5
    @State private var stepCount: Double = 256

    private var steps: Int { max(32, min(512, Int(stepCount.rounded()))) }

    var body: some View {
        GeometryReader { proxy in
            let isLandscape = proxy.size.isLandscape
            let spacing: CGFloat = 18

            Group {
                if isLandscape {
                    HStack(spacing: spacing) { content }
                } else {
                    VStack(spacing: spacing) { content }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.easeInOut, value: curvature)
            .animation(.easeInOut, value: steps)
        }
    }

    private var content: some View {
        Group {
            shapes
                .frame(maxWidth: .infinity, alignment: .center)
            controls
                .frame(maxWidth: 320, alignment: .leading)
        }
    }

    private var shapes: some View {
        VStack(spacing: 25) {
            Superellipse(n: curvature, steps: steps)
                .fill(fillGradient)
                .aspectRatio(1, contentMode: .fit)

            Superellipse(n: curvature, steps: steps)
                .stroke(borderGradient, lineWidth: 5)
                .aspectRatio(1.4, contentMode: .fit)
        }
    }

    private var controls: some View {
        VStack(alignment: .leading, spacing: 12) {
            let curvatureLabel = String(format: "Curvature: %.1f", Double(curvature))
            Text(curvatureLabel)
            Slider(value: $curvature, in: 0...10, step: 0.1)

            Text("Steps: \(steps)")
            Slider(value: $stepCount, in: 32...512, step: 16)
        }
    }

    private var fillGradient: LinearGradient {
        LinearGradient(colors: [.orange, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    }

    private var borderGradient: LinearGradient {
        LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

#Preview("Superellipse demo") {
    SuperellipsePlayground()
}

private extension CGSize {
    var isLandscape: Bool { width > height }
}
#endif

import SwiftUI
import ScaledMetric

struct ScaledMetricDemo: View {
    @ScaledValue private var fontSize: CGFloat = 17

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                HStack {
                    Text("Change your text size to see it in action")
                    Spacer()
                }
                .foregroundColor(.secondary)

                VStack(spacing: 20) {
                    HStack {
                        Text("Fixed")
                        Spacer()
                        Text(".system(size: 17)")
                            .font(.system(size: 17, design: .monospaced))
                    }
                    .font(.system(size: 17))

                    HStack {
                        Text("Scaled")
                        Spacer()
                        Text(".system(size: scaledValue)")
                            .font(.system(size: fontSize, design: .monospaced))
                    }
                    .font(.system(size: fontSize))
                }
            }
            .padding()
        }
    }
}

struct ScaledMetricDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScaledMetricDemo()
    }
}

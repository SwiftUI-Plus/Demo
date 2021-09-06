import SwiftUI
import ScaledMetric

struct ScaledMetricDemo: View {
    @ScaledValue private var fontSize: CGFloat = 17

    var body: some View {
        List {
            Section(footer: Text("Change your dynamic text size to see it in action").padding(.top, 5)) {
                HStack(alignment: .firstTextBaseline) {
                    Text("Fixed")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(".system(size: 17)")
                        .font(.system(size: 17, design: .monospaced))
                }
                .font(.system(size: 17))

                HStack(alignment: .firstTextBaseline) {
                    Text("Scaled")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(".system(size: scaledValue)")
                        .font(.system(size: fontSize, design: .monospaced))
                }
                .font(.system(size: fontSize))
            }
        }
    }
}

struct ScaledMetricDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScaledMetricDemo()
    }
}

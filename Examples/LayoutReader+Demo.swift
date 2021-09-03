import SwiftUI
import Containers

struct LayoutReaderDemo: View {
    var body: some View {
        SwiftUI.ScrollView {
            LayoutReader { layout in
                VStack(spacing: 10) {
                    Text("Readable width: \(Int(layout.size(in: .readable).width))")
                        .font(.headline)
                        .padding()
                }
                .foregroundColor(Color(.systemBackground))
                .multilineTextAlignment(.center)
                .frame(maxWidth: layout.size(in: .readable).width)
                .background(Color.blue)
            }
            .background(Color.gray)

            HStack {
                Text("Rotate or change the dynamic text size to see the width automatically adapt as expected.")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct LayoutReaderDemo_Previews: PreviewProvider {
    static var previews: some View {
        LayoutReaderDemo()
    }
}

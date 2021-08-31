import SwiftUI
import Containers

struct LayoutReaderDemo: View {
    var body: some View {
        SwiftUI.ScrollView {
            LayoutReader { layout in
                VStack(spacing: 10) {
                    Text("Readable width: \(Int(layout.size(in: .readable).width))")
                        .font(.headline)

                    Text("Rotate or change the text size to see it adjust automatically")
                }
                .foregroundColor(Color(.systemBackground))
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.red)
                .frame(maxWidth: layout.size(in: .readable).width)
            }
            .background(Color.gray)
        }
    }
}

struct LayoutReaderDemo_Previews: PreviewProvider {
    static var previews: some View {
        LayoutReaderDemo()
    }
}

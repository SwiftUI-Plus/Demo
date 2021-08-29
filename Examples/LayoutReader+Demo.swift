import SwiftUI
import Containers

struct LayoutReaderDemo: View {
    var body: some View {
        LayoutReader { layout in
            ZStack {
                Rectangle()
                    .foregroundColor(.red)

                VStack(spacing: 10) {
                    Text("Readable width: \(Int(layout.frame(in: .readable).width))")
                        .font(.headline)

                    Text("Rotate or change the text size to see it adjust automatically")
                }
                .foregroundColor(Color(.systemBackground))
                .multilineTextAlignment(.center)
                .padding()
            }
            .frame(maxWidth: layout.frame(in: .readable).width)
        }
    }
}

struct LayoutReaderDemo_Previews: PreviewProvider {
    static var previews: some View {
        LayoutReaderDemo()
    }
}

import SwiftUI
import TextView

struct TextViewDemo: View {
    @State private var text1: String = ""
    @State private var text2: String = ""

    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Scrollable")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                TextView($text1)
                    .placeholder("Placeholder")
                    .enableScrolling(true)
                    .padding(10)
                    .frame(maxHeight: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color(.placeholderText))
                    )
                    .padding()
            }

            VStack {
                Text("Autosizing")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                TextView($text2)
                    .placeholder("Placeholder")
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color(.placeholderText))
                    )
                    .padding()
            }

            Spacer()
        }
    }
}

struct TextViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextViewDemo()
    }
}

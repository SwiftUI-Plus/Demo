import SwiftUI
import TextView

struct TextViewDemo: View {
    @State private var text1: String = ""
    @State private var text2: String = ""

    var body: some View {
        VStack(spacing: 40) {
            VStack {
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

                HStack {
                    Text("Height is fixed but scrolling is enabled when the number of lines grows beyond the bounds.")
                        .font(.footnote)
                        .foregroundColor(.secondary)

                    Spacer()
                }
            }
            .padding(.horizontal)

            VStack {
                TextView($text2)
                    .placeholder("Placeholder")
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color(.placeholderText))
                    )

                HStack {
                    Text("Automatically grows as your type.")
                        .font(.footnote)
                        .foregroundColor(.secondary)

                    Spacer()
                }
            }
            .padding(.horizontal)

            Spacer()
        }
    }
}

struct TextViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextViewDemo()
    }
}

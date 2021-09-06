import SwiftUI
import TextView

struct TextViewDemo: View {
    @State private var text1: String = .loremLong
    @State private var text2: String = .loremShort

    var body: some View {
        List {
            Section(footer: Text("Height is fixed but scrolling is enabled when the text grows beyond the bounds.").padding(.top, 5)) {
                TextView($text1)
                    .placeholder("Placeholder")
                    .enableScrolling(true)
                    .padding(.horizontal, -10)
                    .padding(.vertical, -5)
                    .frame(height: 100)
            }

            Section(footer: Text("Automatically grows as your type.").padding(.top, 5)) {
                TextView($text2)
                    .placeholder("Placeholder")
                    .padding(.horizontal, -5)
                    .padding(.vertical, 5)
            }
        }
    }
}

struct TextViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextViewDemo()
    }
}

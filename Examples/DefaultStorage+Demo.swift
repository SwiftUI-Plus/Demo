import SwiftUI
import DefaultStorage

public struct DefaultStorageDemo: View {
    @DefaultStorage("name") private var textFieldName: String = ""
    @DefaultStorage("name") private var textName: String = ""

    public var body: some View {
        List {
            Section(footer: Text("These 2 views are backed by different properties that point to the same 'key' demonstrating that dynamic properties ensure the views update in realtime.").padding(.top)) {
                TextField("Enter some text", text: $textFieldName)
                Text(textName.isEmpty ? "Empty value" : textName)
                    .foregroundColor(Color(.placeholderText))
            }
        }
        .listStyle(GroupedListStyle())
    }
}

public struct DefaultStorageDemo_Previews: PreviewProvider {
    public static var previews: some View {
        DefaultStorageDemo()
    }
}

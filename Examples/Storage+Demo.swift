import SwiftUI
import DefaultStorage

struct StorageDemo: View {
    @DefaultStorage(wrappedValue: "", "name") private var name

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
//            TextField("Name", text: $name)
//            Text("You entered: \(name)")

            Spacer()
        }
        .padding()
    }
}

struct StorageDemo_Previews: PreviewProvider {
    static var previews: some View {
        StorageDemo()
    }
}

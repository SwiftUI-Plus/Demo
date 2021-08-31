import SwiftUI
import Containers

struct ScrollViewDemo: View {
    var body: some View {
        ScrollableView {
            Text("Top aligned")
            Rectangle()
                .foregroundColor(.blue)
            Text("Bottom aligned")
        }
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}

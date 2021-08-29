import SwiftUI
import ActivityView

struct ActvivityViewDemo: View {
    @State private var item: ActivityItem?

    var body: some View {
        Button {
            item = ActivityItem(items: "Some text to share", activities: [CustomActivity()], excludedTypes: [])
        } label: {
            HStack {
                Image(systemName: "square.and.arrow.up")
                Text("Share")
            }
        }
        .buttonStyle(RoundedButtonStyle())
        .activitySheet($item)
    }
}

final class CustomActivity: UIActivity {
    override var activityTitle: String? { "Custom" }
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool { true }
}

struct ActvivityViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ActvivityViewDemo()
    }
}

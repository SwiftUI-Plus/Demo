import SwiftUI
import ActivityView

struct ActvivityViewDemo: View {
    @State private var item: ActivityItem?

    var body: some View {
        VStack {
            HStack {
                Text(String.loremLong)
                    .foregroundColor(.secondary)

                Spacer()
            }

            Spacer()

            Button {
                item = ActivityItem(items: String.loremLong, activities: [CustomActivity()], excludedTypes: [])
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                    Text("Show share sheet")
                    Spacer()
                }
            }
            .buttonStyle(RoundedButtonStyle())
        }
        .activitySheet($item)
        .padding(.horizontal, 20)
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

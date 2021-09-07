import SwiftUI
import Browsers

struct SafariViewDemo: View {
    @State private var url: URL?

    var body: some View {
        VStack {
            HStack {
                Text("Tap the button to correctly present Safari from SwiftUI")
                    .foregroundColor(.secondary)

                Spacer()
            }

            Spacer()

            Button {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                url = URL(string: "https://google.com")!
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "safari")
                    Text("Show Safari")
                    Spacer()
                }
            }
            .buttonStyle(RoundedButtonStyle())
        }
        .padding(.horizontal, 20)

        Button {
            url = URL(string: "")!
        } label: {
            Text("Show Safari")
        }
        .safari(url: $url, style: .fullScreen) { url in
            Safari(
                configuration: SFSafariViewController.Configuration(),
                activities: { url, title in [] },
                excludedActivities: { url, title in [] },
                preferredBarTintColor: .systemBackground,
                preferredControlTintColor: .label,
                dismissButtonStyle: .close
            )
        }

    }
}

struct SafariViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        SafariViewDemo()
    }
}

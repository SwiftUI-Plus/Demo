import SwiftUI
import MailView

struct MailViewDemo: View {
    @State private var mail: Mail?

    var body: some View {
        VStack {
            HStack {
                if Mail.canSendMail {
                    Text("Tap the button to correctly present Mail from SwiftUI")
                        .foregroundColor(.secondary)
                } else {
                    Text("No mail accounts configured on this device.")
                        .foregroundColor(.secondary)
                }

                Spacer()
            }

            Spacer()

            Button {
                mail = Mail(
                    to: "foo@bar.com",
                    subject: "MailView demo",
                    message: "Mail message goes here..."
                )
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "envelope")
                    Text("Show Mail")
                    Spacer()
                }
            }
            .buttonStyle(RoundedButtonStyle())
            .opacity(Mail.canSendMail ? 1 : 0)
        }
        .mailComposer($mail)
        .padding(.horizontal, 20)
    }
}

struct MailViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        MailViewDemo()
    }
}

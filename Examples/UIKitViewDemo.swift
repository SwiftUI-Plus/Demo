import SwiftUI
import Containers

struct UIKitViewDemo: View {

    private var label: UILabel {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 0

        let text = NSMutableAttributedString(
            string: "If you like these packages you'll like this one.\n\n",
            attributes: [
                .font: UIFont.preferredFont(forTextStyle: .headline),
                .foregroundColor: UIColor.systemBlue
            ]
        )

        text.append(
            NSAttributedString(string: "It allows you to easily apply UIView to your SwiftUI hierarchy.\n\nNote, not all views work correctly and may require special attention in those cases.", attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])
        )

        view.attributedText = text
        return view
    }

    var body: some View {
        ScrollView {
            Section(footer: footer) {
                UIKitView { label }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundColor(Color(.secondarySystemFill))
                    )
            }
            .padding(.horizontal, 20)
        }
    }

    private var footer: some View {
        HStack {
            Text("UILabel inside a SwiftUI view")
                .font(.footnote)
                .foregroundColor(.secondary)

            Spacer()
        }
    }

}

struct UIKitViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        UIKitViewDemo()
    }
}

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(.systemBackground))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 13)
                    .foregroundColor(.blue)
                    .opacity(configuration.isPressed ? 0.5 : 1)
            )
            .animation(.default, value: configuration.isPressed)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        Button { } label: {
            Text("RoundedButton")
        }
        .buttonStyle(RoundedButtonStyle())
    }
}

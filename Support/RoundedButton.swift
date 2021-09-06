import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1)
            .foregroundColor(Color(.systemBackground))
            .font(.headline)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 13)
                    .foregroundColor(.primary)
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

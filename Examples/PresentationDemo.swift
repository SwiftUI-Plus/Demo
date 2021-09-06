import SwiftUI
import Presentation

struct PresentationDemo: View {
    @State private var showSheet: Bool = false
    @State private var showModal: Bool = false
    @State private var showFullscreen: Bool = false
    @State private var showDissolve: Bool = false

    var body: some View {
        List {
            button(titled: "Show sheet") { showSheet = true }
                .present(isPresented: $showSheet) {
                    Presented(subtitle: "Pull to dismiss still works")
                        .navigationBarTitle("Sheet")
                }

            button(titled: "Show modal") { showModal = true }
                .present(isPresented: $showModal, isModal: true) {
                    Presented(subtitle: "Pull to dismiss is now disabled")
                        .navigationBarTitle("Modal")
                }

            button(titled: "Show fullscreen") { showFullscreen = true }
                .present(isPresented: $showFullscreen, style: .fullScreen) {
                    Presented(subtitle: "The view is presented fullscreen")
                        .navigationBarTitle("Fullscreen")
                }

            button(titled: "Show dissolve") { showDissolve = true }
                .present(isPresented: $showDissolve, transition: .crossDissolve, style: .overFullScreen) {
                    Presented(subtitle: "The transition is a cross-dissolve")
                        .navigationBarTitle("Dissolve")
                }
        }
    }

    private func button(titled title: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .foregroundColor(.primary)
    }
}

struct Presented: View {
    @Environment(\.presentation) private var presentation

    let subtitle: String

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(subtitle)
                    .foregroundColor(.secondary)

                Spacer()

                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Tap to Dismiss")
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                .buttonStyle(RoundedButtonStyle())
            }
            .padding(.horizontal, 20)
            .navigationBarTitle("Presented")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PresentationDemo_Previews: PreviewProvider {
    static var previews: some View {
        PresentationDemo()
    }
}

import SwiftUI
import Refreshable

struct RefreshableDemo: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)

                RefreshButton()
                    .onRefresh { refresh in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            refresh.wrappedValue.end()
                        }
                    }
            }

            ZStack {
                Rectangle()
                    .foregroundColor(.gray)

                RefreshButton()
            }
        }
        .padding(.horizontal, 20)
    }
}

struct RefreshButton: View {
    @Namespace private var animation

    var body: some View {
        RefreshableView { phase in
            switch phase {
            case let .idle(refresher, action):
                Button {
                    refresher.perform(action)
                } label: {
                    Text("Refresh")
                }
            case .refreshing:
                VStack(spacing: 10) {
                    if #available(iOS 14, *) {
                        ProgressView()
                    }

                    Text("Refreshing...")
                        .foregroundColor(.secondary)
                }
            case .notSupported:
                VStack(spacing: 5) {
                    Text("Refresh not supported")

                    Group {
                        Text("The ")
                            + Text("onRefresh").font(.system(.body, design: .monospaced))
                            + Text(" modifier was not added to this hierarchy")
                    }
                    .foregroundColor(.secondary)
                }
                .multilineTextAlignment(.center)
                .padding()
            }
        }
    }
}

struct RefreshableDemo_Previews: PreviewProvider {
    static var previews: some View {
        RefreshableDemo()
    }
}

import SwiftUI
import Refreshable

struct RefreshableDemo: View {
    var body: some View {
        VStack(spacing: 40) {
            RefreshButton()
                .onRefresh { refresh in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        refresh.wrappedValue.end()
                    }
                }

            RefreshButton()
        }
        .padding()
    }
}

struct RefreshButton: View {
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
                Text("Refreshing...")
                    .foregroundColor(.secondary)
            case .notSupported:
                Text("Refresh not supported")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct RefreshableDemo_Previews: PreviewProvider {
    static var previews: some View {
        RefreshableDemo()
    }
}

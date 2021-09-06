import SwiftUI

struct RootView: View {

    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        NavigationView {
            List {
                ForEach(demos, id: \.0) { demo in
                    NavigationLink(
                        demo.0,
                        destination: demo.1
                            .navigationBarTitle(demo.0)
                    )
                }
            }
            .navigationBarTitle("Demos")

            Text("Select a demo")
                .foregroundColor(.secondary)
        }
        .navigationStyle(sizeClass: sizeClass ?? .compact)
        .insetGrouped()
    }

    private var demos: [(String, AnyView)] {
        [
            ("Activity View", AnyView(ActvivityViewDemo())),
            ("Connections", AnyView(ConnectionsDemo())),
            ("Default Storage", AnyView(DefaultStorageDemo())),
            ("Fitting Geometry", AnyView(FittingGeometryDemo())),
            ("Layout Reader", AnyView(LayoutReaderDemo())),
            ("Mail View", AnyView(MailViewDemo())),
            ("Media Browser", AnyView(MediaBrowserDemo())),
            ("Media Picker", AnyView(MediaPickerDemo())),
            ("Page View", AnyView(PageViewDemo())),
            ("Presentation", AnyView(PresentationDemo())),
            ("Refreshable", AnyView(RefreshableDemo())),
            ("Scaled Metric", AnyView(ScaledMetricDemo())),
            ("SafariView", AnyView(SafariViewDemo())),
            ("ScrollView", AnyView(ScrollViewDemo())),
            ("TextView", AnyView(TextViewDemo())),
            ("UIKitView", AnyView(UIKitViewDemo())),
        ]
    }

}

private extension View {
    @ViewBuilder
    func insetGrouped() -> some View {
        if #available(iOS 14, *) {
            listStyle(InsetGroupedListStyle())
        } else {
            listStyle(GroupedListStyle())
        }
    }
}

private extension View {
    @ViewBuilder
    func navigationStyle(sizeClass: UserInterfaceSizeClass) -> some View {
        if sizeClass == .compact || UIDevice.current.userInterfaceIdiom == .phone {
            navigationViewStyle(StackNavigationViewStyle())
        } else {
            navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

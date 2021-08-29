import SwiftUI

struct RootView: View {

    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        NavigationView {
            List {
                ForEach(demos.indices, id: \.self) { index in
                    NavigationLink(
                        demos[index].0,
                        destination: demos[index].1
                            .navigationBarTitle(demos[index].0)
                    )
                }
            }
            .navigationBarTitle("Demos")
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Demos")

            Text("Select a demo")
                .foregroundColor(.secondary)
        }
        .navigationStyle(sizeClass: sizeClass ?? .compact)
    }

    private var demos: [(String, AnyView)] {
        [
            ("Activity View", AnyView(ActvivityViewDemo())),
            ("Fitting Geometry", AnyView(FittingGeometryDemo())),
            ("Layout Reader", AnyView(LayoutReaderDemo())),
            ("Media Browser", AnyView(MediaBrowserDemo())),
            ("Media Picker", AnyView(MediaPickerDemo())),
            ("Page View", AnyView(PageViewDemo())),
            ("Presentation", AnyView(PresentationDemo())),
            ("Refreshable", AnyView(RefreshableDemo())),
            ("Scaled Metric", AnyView(ScaledMetricDemo())),
            ("ScrollView", AnyView(ScrollViewDemo())),
//            ("Storage", AnyView(StorageDemo())),
        ]
    }

}

extension View {
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

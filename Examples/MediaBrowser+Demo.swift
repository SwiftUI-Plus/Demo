import SwiftUI
import Media

struct MediaBrowserDemo: View {
    @FetchCollectionList(list: .folder, kind: .regularFolder) private var folders
    @FetchAssetCollection(album: .album) private var albums

    var body: some View {
        List {
            Section(footer: Text("Add or remove folders or albums in your photo library to see this update automatically")) { }
                .padding(.bottom)

            Section(header: Text("Folders")) {
                ForEach(folders) { folder in
                    Text(folder.localizedTitle ?? "Untitled")
                }
            }

            Section(header: Text("Albums")) {
                ForEach(albums) { album in
                    Text(album.localizedTitle ?? "Untitled")
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

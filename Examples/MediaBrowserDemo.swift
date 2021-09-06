import SwiftUI
import Media

struct MediaBrowserDemo: View {
    @FetchCollectionList(list: .folder, kind: .regularFolder) private var folders
    @FetchAssetCollection(album: .album) private var albums

    var body: some View {
        List {
            Text("Add/remove folders or albums in your photo library to see this update automatically")
                .padding(.vertical, 10)

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
    }
}

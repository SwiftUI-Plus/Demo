import SwiftUI
import Containers

struct ScrollViewDemo: View {
    @State private var contentMode: ContentMode = .fill

    var body: some View {
        ScrollableView(contentMode: contentMode) {
            Group {
                Picker("Content Mode", selection: $contentMode.animation(.spring())) {
                    Text("Fill")
                        .tag(ContentMode.fill)
                    Text("Fit")
                        .tag(ContentMode.fit)
                }
                .pickerStyle(SegmentedPickerStyle())

                HStack {
                    Spacer()
                    Text("First view")
                        .padding()
                    Spacer()
                }
                .background(Color.gray)

                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)

                    Text("Middle view")
                        .foregroundColor(.white)
                        .padding()
                }

                HStack {
                    Spacer()
                    Text("Last view")
                        .padding()
                    Spacer()
                }
                .background(Color.gray)
            }
            .padding(.horizontal)
        }
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}

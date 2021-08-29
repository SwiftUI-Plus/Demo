import SwiftUI
import Containers

struct PageViewDemo: View {
    @State private var page: Int = 0

    private var colors: [Color] = [
        .red,
        .blue,
        .yellow,
        .green,
        .orange
    ]

    var body: some View {
        if #available(iOS 14, *) {
            VStack {
                PageView(selection: $page, contentMode: .fit) {
                    ForEach(colors.indices, id: \.self) { index in
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Page \(index + 1)")
                                Spacer()
                            }
                            Spacer()
                        }
                        .background(colors[index])
                    }
                }

                PageView(selection: $page, contentMode: .fill) {
                    ForEach(colors.indices, id: \.self) { index in
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Page \(index + 1)")
                                Spacer()
                            }
                            Spacer()
                        }
                        .background(colors[index])
                    }
                }
            }
        } else {
            Text("This view is only available on iOS 14+")
                .foregroundColor(.secondary)
        }
    }
}

struct PageViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        PageViewDemo()
    }
}

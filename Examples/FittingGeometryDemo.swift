import SwiftUI
import Containers

struct FittingGeometryDemo: View {
    var body: some View {
        ScrollView {
            FittingGeometryReader { geo in
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)

                    VStack(spacing: 10) {
                        Text("Fitting height: \(Int(geo.size.height))")
                            .font(.headline)

                        Text(String.loremLong)
                    }
                    .padding(20)
                }
            }
            .padding(.horizontal, 20)
            .background(Color.gray)
            .multilineTextAlignment(.center)

            HStack {
                Text("Note the GeometryReader hugs its content instead of taking up all available space.")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct FittingGeometryDemo_Previews: PreviewProvider {
    static var previews: some View {
        FittingGeometryDemo()
    }
}

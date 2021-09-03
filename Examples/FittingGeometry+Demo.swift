import SwiftUI
import Containers

struct FittingGeometryDemo: View {
    var body: some View {
        ScrollView {
            VStack {
                FittingGeometryReader { _ in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height: 44)

                        Text("Content")
                            .foregroundColor(Color(.systemBackground))
                    }
                    .padding()
                }
                .background(Color.gray)
                .multilineTextAlignment(.center)

                HStack {
                    Text("Note the GeometryReader hugs its content instead of taking up all available space.")
                        .font(.footnote)
                        .foregroundColor(.secondary)

                    Spacer()
                }
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

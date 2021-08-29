import SwiftUI
import Containers

struct FittingGeometryDemo: View {
    var body: some View {
        VStack {
            Text("The reader hugs its content")

            FittingGeometryReader { _ in
                ZStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(height: 44)

                    Text("Content")
                        .foregroundColor(Color(.systemBackground))
                }
            }
            .padding()
            .background(Color.gray)
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

struct FittingGeometryDemo_Previews: PreviewProvider {
    static var previews: some View {
        FittingGeometryDemo()
    }
}

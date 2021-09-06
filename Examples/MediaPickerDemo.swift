import SwiftUI
import Media

struct MediaPickerDemo: View {

    @State private var showActions: Bool = false
    @State private var showCamera: Bool = false
    @State private var showPicker: Bool = false
    @State private var data: Data?
    @State private var importError: ImportError?

    var body: some View {
        VStack {
            HStack {
                Text("Tap the button to see the media pickers.")
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button {
                showActions = true
            } label: {
                if let data = data, let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                        Text("Import Media")
                        Spacer()
                    }
                }
            }
            .buttonStyle(preferPlain: data != nil)
            .padding(.horizontal, 20)
        }
        .actionSheet(isPresented: $showActions) {
            ActionSheet(title: Text("Import a photo"), buttons: [
                camera,
                library,
                .cancel()
            ].compactMap { $0 })
        }
        .camera(isPresented: $showCamera, onComplete: handleResult)
        .imagePicker(isPresented: $showPicker, onComplete: handleResult)
        .alert(item: $importError) { error in
            Alert(
                title: Text("Failed"),
                message: Text(error.localizedDescription),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    private var camera: Alert.Button? {
        UIImagePickerController.isSourceTypeAvailable(.camera)
        ? .default(Text("Take a photo")) { showCamera = true } : nil
    }

    private var library: Alert.Button? {
        UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        ? .default(Text("Choose from library")) { showPicker = true } : nil
    }

    private func handleResult(_ result: Result<URL, Error>) {
        switch result {
        case let .success(url):
            do {
                data = try Data(contentsOf: url)
            } catch {
                importError = ImportError(underlyingError: error)
            }
        case let .failure(error):
            importError = ImportError(underlyingError: error)
        }
    }
}

private extension View {
    @ViewBuilder
    func buttonStyle(preferPlain: Bool) -> some View {
        if preferPlain {
            buttonStyle(PlainButtonStyle())
        } else {
            buttonStyle(RoundedButtonStyle())
        }
    }
}

struct MediaPickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        MediaPickerDemo()
    }
}

extension MediaPickerDemo {
    private struct ImportError: LocalizedError, Identifiable {
        let id = UUID()
        let underlyingError: Error

        var errorDescription: String? {
            underlyingError.localizedDescription
        }
    }
}

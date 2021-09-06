//import SwiftUI
//import Browsers
//
//struct WebViewDemo: View {
//
//    // if you're targetting iOS 13+ this will crash
//    @ObservedObject private var observer: WebViewObserver
//
//    init() {
//        let config = WKWebViewConfiguration()
//        config.websiteDataStore = .default()
//        observer = .init(config: config)
//    }
//
//    var body: some View {
//        VStack(spacing: 0) {
//            WebView(url: URL(string: "https://www.apple.com")!, observer: observer)
//                .onBegan { nav in
//                    print("Began \(nav.isProvisional ? "provisional" : "load")")
//                }
//                .onFailed { nav, error in
//                    print("Failed \(nav.isProvisional ? "provisional" : "load") | \(error)")
//                }
//                .onEnded {
//                    print("Ended")
//                }
//
//            HStack(spacing: 20) {
//                Button {
//
//                } label: {
//                    Image(systemName: "chevron.left")
//                }
//                .disabled(true)
////                .disabled(observer.webView.canGoBack)
//
//                Spacer()
//
//                Button {
//                    if observer.webView.isLoading {
//                        observer.stopLoading()
//                    } else {
//                        observer.reload(fromOrigin: true)
//                    }
//                } label: {
//                    if observer.webView.isLoading {
//                        Image(systemName: "xmark")
//                    } else {
//                        Image(systemName: "arrow.clockwise")
//                    }
//                }
//
//                Spacer()
//
//                Button {
//
//                } label: {
//                    Image(systemName: "chevron.right")
//                }
//                .disabled(true)
////                .disabled(observer.webView.canGoForward)
//            }
//            .frame(height: 44)
//            .padding(20)
//            .accentColor(.white)
//            .font(.system(size: 20))
//            .overlay(
//                GeometryReader { geo in
//                    Capsule()
//                        .foregroundColor(.blue)
//                        .frame(width: geo.size.width * CGFloat(observer.progress), height: 4)
//                }
//                .opacity(observer.webView.isLoading ? 1 : 0)
//            , alignment: .topLeading)
//        }
//        .navigationBarTitle(Text(observer.webView.title ?? "Untitled"), displayMode: .inline)
//    }
//}
//
//struct WebViewDemo_Previews: PreviewProvider {
//    static var previews: some View {
//        WebViewDemo()
//    }
//}

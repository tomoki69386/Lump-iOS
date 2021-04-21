import Cache
import UIKit
import SwiftUI
import Combine

public struct CacheableImage: View {
    class CacheableImageViewModel: ObservableObject {
        let url = PassthroughSubject<URL, Error>()
        @Published var image: UIImage?
        var cancellables = [AnyCancellable]()
        
        init() {
            let fetchImageStream = url.flatMap { url -> Future<UIImage?, Error> in
                return Future<UIImage?, Error> { promise in
                    
                    if let image = UIImageCache.shared.load(for: url.absoluteString) {
                        return promise(.success(image))
                    } else {
                        URLSession.shared.dataTask(with: url) { (data, _, _) in
                            guard let data = data else {
                                return promise(.success(nil))
                            }
                            DispatchQueue.main.async {
                                guard let image = UIImage(data: data) else {
                                    return promise(.success(nil))
                                }
                                UIImageCache.shared.store(image, for: url.absoluteString)
                                promise(.success(image))
                            }
                        }
                        .resume()
                    }
                }
            }
            .catch { _ in Just(nil) }
            .assign(to: \.image, on: self)
            
            cancellables += [
                fetchImageStream
            ]
        }
    }
    
    @ObservedObject var viewModel = CacheableImageViewModel()
    
    public init(_ urlString: String) {
        if let url = URL(string: urlString) {
            viewModel.url.send(url)
        }
    }
    
    public var body: some View {
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            ProgressView()
        }
    }
}

struct CacheableImagePreviews: PreviewProvider {
    static var previews: some View {
        CacheableImage("https://pbs.twimg.com/profile_images/1154807693590183936/VcVxrhaT_400x400.jpg")
            .previewLayout(.sizeThatFits)
    }
}

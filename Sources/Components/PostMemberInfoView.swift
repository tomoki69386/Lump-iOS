import Entity
import SwiftUI

public struct PostMemberInfoView: View {
    
    var mediaType: MediaType
    var imageUrl: String {
        switch mediaType {
        case .twitter:
            return "https://e7.pngegg.com/pngimages/708/311/png-clipart-twitter-twitter-thumbnail.png"
        case .youtube:
            return "https://1000logos.net/wp-content/uploads/2017/05/youtube-symbol.jpg"
        case .instagram:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/480px-Instagram_icon.png"
        }
    }
    
    public init(mediaType: MediaType) {
        self.mediaType = mediaType
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            CacheableImage(imageUrl)
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            Text("yukos0520")
            Spacer()
        }
    }
}

struct PostMemberInfoViewPreview: PreviewProvider {
    static var previews: some View {
        ForEach(MediaType.allCases, id: \.self) { mediaType in
            PostMemberInfoView(mediaType: mediaType)
                .previewLayout(.sizeThatFits)
        }
    }
}

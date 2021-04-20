import SwiftUI

public struct PostYouTubeView: View {
    
    @State var geometryReaderTotalHeight = CGFloat(0)
    
    public init() { }
    
    public var body: some View {
        VStack(spacing: 8) {
            PostMemberInfoView(mediaType: .youtube, name: "ゆうこすモテちゃんねる")
                .padding(.init(top: 16, leading: 16, bottom: 0, trailing: 16))
            
            GeometryReader { geometry in
                CacheableImage("https://pbs.twimg.com/media/EPs0i7MUEAApB6D.jpg")
                    .frame(width: geometry.size.width, height: geometry.size.width * 0.557)
                    .clipped()
                    .background(GeometryReader { gr -> Color in
                        DispatchQueue.main.async {
                            self.geometryReaderTotalHeight = gr.size.height
                        }
                        return Color.clear
                    })
            }
            .frame(height: geometryReaderTotalHeight)
            
            VStack(spacing: 8) {
                HStack {
                    Text("【恋バナ】糖質78%オフした生チョコタルト作ったら美味しすぎた...【ゆる料理】")
                        .lineLimit(2)
                    Spacer()
                }
                HStack {
                    Text("2020/01/01")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct PostYouTubeViewPreviews: PreviewProvider {
    static var previews: some View {
        PostYouTubeView()
            .previewLayout(.sizeThatFits)
    }
}

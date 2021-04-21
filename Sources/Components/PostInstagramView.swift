import SwiftUI
import CacheableImage

public struct PostInstagramView: View {
    
    @State var geometryReaderTotalHeight = CGFloat(0)
    
    public init() { }
    
    public var body: some View {
        VStack(spacing: 8) {
            PostMemberInfoView(mediaType: .instagram, name: "yukos0520")
                .padding(.init(top: 16, leading: 16, bottom: 0, trailing: 16))
            
            GeometryReader { geometry in
                CacheableImage("https://pbs.twimg.com/media/EygjXVwVEAAcr6p?format=jpg")
                    .frame(width: geometry.size.width, height: geometry.size.width)
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
                    Text("今日は青みピンクリップでメイクしてみたよ〜❤︎﻿\n実は、ゆうこすのパーソナルカラーはイエローベースだから、、似合わない！とされてる色なんだよね🤔﻿\nでも、自分のパーソナルカラーじゃない色って、顔か")
                        .lineLimit(3)
                    Spacer()
                }
                HStack {
                    Text("2020/01/01")
                        .foregroundColor(.secondary)
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("続きを見る")
                            .foregroundColor(.secondary)
                    })
                }
            }
            .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct PostInstagramViewPreview: PreviewProvider {
    static var previews: some View {
        PostInstagramView()
            .previewLayout(.sizeThatFits)
    }
}

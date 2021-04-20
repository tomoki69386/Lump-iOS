import Entity
import SwiftUI

public struct PostContentTwitterView: View {
    
    @State var geometryReaderTotalHeight = CGFloat(0)
    
    public init() { }
    
    public var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                CacheableImage("https://pbs.twimg.com/profile_images/1154807693590183936/VcVxrhaT_400x400.jpg")
                    .clipShape(Circle())
                    .frame(width: 24, height: 24)
                
                Text("tomoki_sun")
                
                Text("@tomoki_sun")
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ellipsis.circle")
                })
            }
            
            GeometryReader { geometry in
                CacheableImage("https://pbs.twimg.com/profile_images/1154807693590183936/VcVxrhaT_400x400.jpg")
                    .frame(width: geometry.size.width, height: geometry.size.width / 1.5)
                    .clipped()
                    .background(GeometryReader { gr -> Color in
                        DispatchQueue.main.async {
                            self.geometryReaderTotalHeight = gr.size.height
                        }
                        return Color.clear
                    })
            }
            .frame(height: geometryReaderTotalHeight)
            
            Text("てすとおおおおお")
        }
    }
}

struct PostContentTwitterViewPreviews: PreviewProvider {
    static var previews: some View {
        PostContentTwitterView()
            .previewLayout(.sizeThatFits)
    }
}

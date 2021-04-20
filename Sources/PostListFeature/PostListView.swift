import SwiftUI
import Components

public struct PostListView: View {
    public init() { }
    public var body: some View {
        NavigationView {
            ScrollView {
                ForEach(1...3, id: \.self) { count in
                    PostTwitterView()
                    PostYouTubeView()
                    PostInstagramView()
                }
            }
            .navigationViewStyle(DefaultNavigationViewStyle())
            .navigationTitle("Post Lists")
        }
    }
}

struct PostListViewPreviews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}

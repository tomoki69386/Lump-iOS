import SwiftUI
import Components

public struct PostListView: View {
    public init() { }
    public var body: some View {
        NavigationView {
            ScrollView {
                ForEach(1...10, id: \.self) { count in
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

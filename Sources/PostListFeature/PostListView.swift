import SwiftUI
import Components

public struct PostListView: View {
    public init() { }
    public var body: some View {
        NavigationView {
            ScrollView {
                ForEach(1...10, id: \.self) { count in
                    PostContentTwitterView()
                }
                .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
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

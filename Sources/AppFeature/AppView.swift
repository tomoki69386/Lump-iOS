import SwiftUI
import GroupListFeature
import PostListFeature

public struct AppView: View {
    
    public init() { }
    
    public var body: some View {
        TabView {
            GroupListView()
                .tag(1)
                .tabItem {
                    Text("Group")
                }
            
            PostListView()
                .tag(2)
                .tabItem {
                    Text("Post")
                }
        }
    }
}

struct AppViewPreview: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

import SwiftUI
import GroupListFeature
import GroupTimelineFeature
import GroupCreateFeature

public struct AppView: View {
    
    public init() { }
    
    public var body: some View {
        TabView {
            GroupListView()
                .tag(1)
                .tabItem {
                    Text("Group")
                }
            
            GroupTimelineView()
                .tag(1)
                .tabItem {
                    Text("Timeline")
                }
            
            GroupCreateView()
                .tag(3)
                .tabItem {
                    Text("Create")
                }
        }
    }
}

struct AppViewPreview: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

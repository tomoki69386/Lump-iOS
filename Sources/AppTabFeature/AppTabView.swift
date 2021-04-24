import GroupCreateFeature
import GroupListFeature
import GroupTimelineFeature
import SwiftUI

public struct AppTabView: View {

  public init() {}

  public var body: some View {
    TabView {
      GroupListView()
        .tag(1)
        .tabItem {
          Text("Group")
        }

      GroupTimelineView()
        .tag(2)
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

struct AppTabViewPreview: PreviewProvider {
  static var previews: some View {
    AppTabView()
  }
}

import GroupListFeature
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
    }
  }
}

struct AppTabViewPreview: PreviewProvider {
  static var previews: some View {
    AppTabView()
  }
}

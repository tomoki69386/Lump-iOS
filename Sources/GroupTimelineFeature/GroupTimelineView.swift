import Component
import SwiftUI

public struct GroupTimelineView: View {

  public init() {}

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
      .navigationTitle("Timeline")
    }
  }
}

struct GroupTimelineViewPreview: PreviewProvider {
  static var previews: some View {
    GroupTimelineView()
  }
}

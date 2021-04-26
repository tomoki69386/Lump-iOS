import SwiftUI
import SettingFeature
import GroupTimelineFeature

public struct GroupListView: View {

  public init() {}

  public var body: some View {
    NavigationView {
      ScrollView {
        ForEach(1...10, id: \.self) { count in
          NavigationLink(
            destination: GroupTimelineView(),
            label: {
              GroupRowView(group: .init(id: count, name: "\(count)"))
            })
        }
      }
      .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
      .navigationViewStyle(DefaultNavigationViewStyle())
      .navigationTitle("Group List")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          NavigationLink(
            destination: SettingView(),
            label: {
              Image(systemName: "gear")
            })
        }
      }
      .padding(.top, 16)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct GroupListViewPreviews: PreviewProvider {
  static var previews: some View {
    GroupListView()
  }
}

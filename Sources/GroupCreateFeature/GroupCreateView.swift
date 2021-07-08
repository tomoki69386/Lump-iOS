import Component
import GroupNameFeature
import Styleguide
import SwiftUI

public struct GroupCreateView: View {

  public init() {
  }

  public var body: some View {
    ScrollView(.vertical) {
      LazyVStack(pinnedViews: [.sectionHeaders]) {
        Section(header: ListHeader(title: "NAME")) {
          NavigationLink(
            destination: GroupNameView(),
            label: {
              Text("Tapped")
            })
        }
        Section(header: ListHeader(title: "MEMBERS")) {
          MemberRow(mediaType: .twitter, name: "tomoki_sun")
          MemberRow(mediaType: .instagram, name: "tomoki_sun")
        }
      }
    }
    .navigationStyle(
      title: "GROUP CREATE",
      presentationStyle: .modal,
      onDismiss: {}
    )
  }
}

struct GroupCreateViewPreview: PreviewProvider {
  static var previews: some View {
    GroupCreateView()
  }
}

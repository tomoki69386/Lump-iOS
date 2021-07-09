import Component
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
              HStack {
                Text("ここにグループの名前を入れます")
                  .font(.system(size: 20, weight: .bold, design: .default))
                  .foregroundColor(Color.lump.navy)
                Spacer()
              }
              .padding([.leading, .trailing], 12)
              .padding([.top, .bottom], 8)
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
      presentationStyle: .side,
      positive: {},
      onDismiss: {}
    )
  }
}

struct GroupCreateViewPreview: PreviewProvider {
  static var previews: some View {
    GroupCreateView()
  }
}

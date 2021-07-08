import Component
import SwiftUI
import Styleguide

public struct GroupNameView: View {
  @State var text = ""
  
  public init() {}
  
  public var body: some View {
    VStack(alignment: .center) {
      Spacer()
      PlaceholderTextField(
        alignment: .center,
        placeholder: Text("GROUP NAME"),
        text: $text,
        onEditingChanged: { _ in },
        onCommit: {}
      )
      Spacer()
    }
    .padding([.leading, .trailing], 12)
    .navigationStyle(
      title: "GROUP NAME",
      presentationStyle: .modal,
      onDismiss: {}
    )
  }
}

struct GroupNameViewPreview: PreviewProvider {
  static var previews: some View {
    GroupNameView()
  }
}

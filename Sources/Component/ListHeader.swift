import SwiftUI
import Styleguide

public struct ListHeader: View {
  
  let title: String
  
  public init(
    title: String
  ) {
    self.title = title
  }
  
  public var body: some View {
    HStack {
      Text(title)
        .foregroundColor(Color.lump.text.secondary)
        .font(.system(size: 20, weight: .bold, design: .default))
      Spacer()
    }
    .padding([.leading, .trailing], 12)
    .frame(height: 41)
    .background(Color.white)
  }
}

struct ListHeaderPreview: PreviewProvider {
  static var previews: some View {
    ListHeader(title: "NAVIGATION TITLE")
      .previewLayout(.sizeThatFits)
  }
}

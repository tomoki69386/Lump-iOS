import SwiftUI

struct NavigationBarSide: View {
  var positive: () -> Void
  var negative: () -> Void

  var body: some View {
    HStack {
      CircleButton(
        foregroundColor: Color.lump.navy,
        backgroundColor: Color.lump.text.tertiary,
        action: negative,
        content: {
          Text(Image(systemName: "arrow.left"))
        }
      )
      Spacer()
      CircleButton(
        foregroundColor: Color.white,
        backgroundColor: Color.lump.primary,
        action: positive,
        content: {
          Text(Image(systemName: "arrow.right"))
        }
      )
    }
    .padding([.leading, .trailing], 12)
  }
}

struct NavigationBarSidePreview: PreviewProvider {
  static var previews: some View {
    NavigationBarSide(positive: {}, negative: {})
      .previewLayout(.sizeThatFits)
  }
}

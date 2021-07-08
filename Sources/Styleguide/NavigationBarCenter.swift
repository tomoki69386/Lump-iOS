import SwiftUI

struct NavigationBarCenter: View {
  var action: () -> Void
  var body: some View {
    HStack {
      Spacer()
      CircleButton(
        foregroundColor: Color.lump.navy,
        backgroundColor: Color.lump.text.tertiary,
        action: action,
        content: {
          Text(Image(systemName: "xmark"))
        }
      )
      Spacer()
    }
  }
}

struct NavigationBarCenterPreview: PreviewProvider {
  static var previews: some View {
    NavigationBarCenter(action: {})
      .previewLayout(.sizeThatFits)
  }
}

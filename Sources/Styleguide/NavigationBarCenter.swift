import SwiftUI

struct NavigationBarCenter: View {
  var presentationStyle: NavigationPresentationStyle
  var action: () -> Void

  var foregroundColor: Color {
    presentationStyle == .positive
      ? Color.white
      : Color.lump.navy
  }

  var backgroundColor: Color {
    presentationStyle == .positive
      ? Color.lump.primary
      : Color.lump.text.tertiary
  }

  var body: some View {
    HStack {
      Spacer()
      CircleButton(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        action: action,
        content: {
          Text(
            Image(
              systemName: presentationStyle == .positive
                ? "checkmark"
                : "xmark"
            )
          )
        }
      )
      Spacer()
    }
  }
}

struct NavigationBarCenterPreview: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationBarCenter(presentationStyle: .positive, action: {})
      NavigationBarCenter(presentationStyle: .negative, action: {})
    }
    .previewLayout(.sizeThatFits)
  }
}

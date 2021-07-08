import SwiftUI

public enum NavigationPresentationStyle {
  case navigation
  case modal
  case empty
}

extension View {
  public func navigationStyle(
    backgroundColor: Color = .white,
    title: String,
    presentationStyle: NavigationPresentationStyle,
    positive: @escaping () -> Void,
    onDismiss: @escaping () -> Void
  ) -> some View {
    Navigation(
      backgroundColor: backgroundColor,
      title: title,
      presentationStyle: presentationStyle,
      positive: positive,
      onDismiss: onDismiss,
      content: self
    )
  }
}

private struct Navigation<Content: View>: View {
  @Environment(\.presentationMode) @Binding var presentationMode
  let backgroundColor: Color
  let title: String
  let presentationStyle: NavigationPresentationStyle
  let positive: () -> Void
  let onDismiss: () -> Void
  let content: Content

  var body: some View {
    VStack {
      HStack {
        Text(title)
          .foregroundColor(Color.lump.navy)
          .font(.system(size: 25, weight: .black, design: .default))
        Spacer()
      }
      .padding([.top, .leading, .trailing], 12)

      content

      if presentationStyle == .modal {
        NavigationBarCenter(action: self.dismiss)
          .padding(.bottom, 12)
      } else if presentationStyle == .navigation {
        NavigationBarSide(
          positive: positive,
          negative: self.dismiss
        )
        .padding(.bottom, 12)
      }
    }
    .background(backgroundColor.ignoresSafeArea())
    .navigationBarHidden(true)
  }

  func dismiss() {
    self.onDismiss()
    self.presentationMode.dismiss()
  }
}

struct NavigationPreview: PreviewProvider {
  static var previews: some View {
    Group {
      Navigation(
        backgroundColor: Color.white,
        title: "NAVIGATION TITLE",
        presentationStyle: .modal,
        positive: {},
        onDismiss: {},
        content: VStack {
          Spacer()
          Text("Content")
          Spacer()
        }
      )

      Navigation(
        backgroundColor: Color.white,
        title: "NAVIGATION TITLE",
        presentationStyle: .navigation,
        positive: {},
        onDismiss: {},
        content: VStack {
          Spacer()
          Text("Content")
          Spacer()
        }
      )

      Navigation(
        backgroundColor: Color.white,
        title: "NAVIGATION TITLE",
        presentationStyle: .empty,
        positive: {},
        onDismiss: {},
        content: VStack {
          Spacer()
          Text("Content")
          Spacer()
        }
      )
    }
  }
}

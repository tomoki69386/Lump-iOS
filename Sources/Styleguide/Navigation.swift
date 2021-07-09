import SwiftUI

public enum NavigationPresentationStyle: CaseIterable {
  case positive
  case negative
  case side
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
      
      switch presentationStyle {
      case .positive, .negative:
        NavigationBarCenter(
          presentationStyle: presentationStyle,
          action: self.dismiss
        )
      case .side:
        NavigationBarSide(
          positive: positive,
          negative: self.dismiss
        )
      case .empty:
        EmptyView()
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
    ForEach(NavigationPresentationStyle.allCases, id: \.self) { presentationStyle in
      Navigation(
        backgroundColor: Color.white,
        title: "NAVIGATION TITLE",
        presentationStyle: presentationStyle,
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

import SwiftUI

public struct CircleButton: View {
  
  let foregroundColor: Color
  let backgroundColor: Color
  var action: () -> Void
  let content: Text
  
  public init(
    foregroundColor: Color,
    backgroundColor: Color,
    action: @escaping () -> Void,
    @ViewBuilder content: () -> Text
  ) {
    self.foregroundColor = foregroundColor
    self.backgroundColor = backgroundColor
    self.action = action
    self.content = content()
  }
  
  public var body: some View {
    Button(action: action, label: {
      content
        .font(.system(size: 23, weight: .heavy, design: .default))
    })
    .foregroundColor(foregroundColor)
    .frame(width: 54, height: 46)
    .background(backgroundColor)
    .cornerRadius(19)
  }
}

struct CircleButtonPreview: PreviewProvider {
  static var previews: some View {
    CircleButton(
      foregroundColor: Color.white,
      backgroundColor: Color.lump.primary,
      action: {},
      content: {
        Text(Image(systemName: "arrow.right"))
      }
    )
    .padding()
    .previewLayout(.sizeThatFits)
  }
}

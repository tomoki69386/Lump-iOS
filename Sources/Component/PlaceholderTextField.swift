import SwiftUI
import Styleguide

public struct PlaceholderTextField: View {

  let alignment: Alignment
  let placeholder: Text
  @Binding var text: String
  var onEditingChanged: (Bool) -> Void
  var onCommit: () -> Void

  public init(
    alignment: Alignment,
    placeholder: Text,
    text: Binding<String>,
    onEditingChanged: @escaping (Bool) -> Void,
    onCommit: @escaping () -> Void
  ) {
    self.alignment = alignment
    self.placeholder = placeholder
    self._text = text
    self.onEditingChanged = onEditingChanged
    self.onCommit = onCommit
  }

  public var body: some View {
    ZStack(alignment: alignment) {
      if text.isEmpty {
        placeholder
          .foregroundColor(Color.lump.text.secondary)
          .font(.system(size: 20, weight: .bold, design: .default))
      }
      TextField(
        "",
        text: $text,
        onEditingChanged: onEditingChanged,
        onCommit: onCommit
      )
      .foregroundColor(Color.primary)
      .font(.title2)
    }
  }
}

struct PlaceholderTextFieldPreviews: PreviewProvider {
  @State static var text = "aaaaaa"
  @State static var textEmpty = ""
  static var previews: some View {
    Group {
      PlaceholderTextField(
        alignment: .leading,
        placeholder: Text("Search"),
        text: $text,
        onEditingChanged: { _ in },
        onCommit: {}
      )
      .previewLayout(.sizeThatFits)
      .previewDisplayName("テキストあり")

      PlaceholderTextField(
        alignment: .leading,
        placeholder: Text("Search"),
        text: $textEmpty,
        onEditingChanged: { _ in },
        onCommit: {}
      )
      .previewLayout(.sizeThatFits)
      .previewDisplayName("テキストなし")
    }
  }
}

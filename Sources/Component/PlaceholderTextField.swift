import SwiftUI

public struct PlaceholderTextField: View {
  
  public var placeholder: Text
  @Binding public var text: String
  public var onEditingChanged: (Bool) -> Void
  public var onCommit: () -> Void
  
  public init(
    placeholder: Text,
    text: Binding<String>,
    onEditingChanged: @escaping (Bool) -> Void,
    onCommit: @escaping () -> Void
  ) {
    self.placeholder = placeholder
    self._text = text
    self.onEditingChanged = onEditingChanged
    self.onCommit = onCommit
  }
  
  public var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        placeholder
          .foregroundColor(Color(UIColor.tertiaryLabel))
          .font(.title2)
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
        placeholder: Text("Search"),
        text: $text,
        onEditingChanged: { _ in },
        onCommit: { }
      )
      .previewLayout(.sizeThatFits)
      .previewDisplayName("テキストあり")
      
      PlaceholderTextField(
        placeholder: Text("Search"),
        text: $textEmpty,
        onEditingChanged: { _ in },
        onCommit: { }
      )
      .previewLayout(.sizeThatFits)
      .previewDisplayName("テキストなし")
    }
  }
}

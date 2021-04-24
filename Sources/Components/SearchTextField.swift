import SwiftUI

public struct SearchTextField: View {
  
  @State var text = ""
  
  public init() { }
  
  public var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .foregroundColor(Color(UIColor.tertiaryLabel))
        .padding(.leading, 16)
      TextField("Search", text: $text)
        .foregroundColor(Color(UIColor.tertiaryLabel))
        .font(.title2)
    }
    .frame(height: 50)
    .background(Color(UIColor.systemGray6))
    .cornerRadius(16)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .stroke(Color(UIColor.tertiaryLabel), lineWidth: 1)
    )
  }
}

struct SearchTextFieldPreview: PreviewProvider {
  static var previews: some View {
    SearchTextField()
      .previewLayout(.sizeThatFits)
  }
}

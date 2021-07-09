import Entity
import Styleguide
import SwiftUI

public struct MemberRow: View {

  var mediaType: MediaType
  var name: String

  public init(
    mediaType: MediaType,
    name: String
  ) {
    self.mediaType = mediaType
    self.name = name
  }

  public var body: some View {
    HStack(spacing: 8) {
      CircleImage(imageName: mediaType.rawValue)
      Text(name)
        .font(.system(size: 20, weight: .bold, design: .default))
        .foregroundColor(Color.lump.navy)
      Spacer()
    }
    .padding([.leading, .trailing], 12)
  }
}

struct MemberRowPreview: PreviewProvider {
  static var previews: some View {
    ForEach(MediaType.allCases, id: \.self) { type in
      MemberRow(mediaType: type, name: "tomoki_sun")
    }
    .previewLayout(.sizeThatFits)
  }
}

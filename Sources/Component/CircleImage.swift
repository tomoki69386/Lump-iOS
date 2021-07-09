import CacheableImage
import SwiftUI

public struct CircleImage: View {
  let imageUrlString: String?
  let imageName: String?
  let systemName: String?

  public init(
    imageUrlString: String?
  ) {
    self.imageUrlString = imageUrlString
    self.imageName = nil
    self.systemName = nil
  }

  public init(
    imageName: String
  ) {
    self.imageUrlString = nil
    self.imageName = imageName
    self.systemName = nil
  }

  public init(
    systemName: String
  ) {
    self.imageUrlString = nil
    self.imageName = nil
    self.systemName = systemName
  }

  public var body: some View {
    VStack {
      if let imageName = imageName {
        Image(imageName, bundle: .module)
          .resizable()
          .frame(width: 46, height: 46)
      } else if let imageUrlString = imageUrlString {
        CacheableImage(imageUrlString)
          .frame(width: 46, height: 46)
      } else {
        Image(systemName: systemName ?? "")
          .frame(width: 46, height: 46)
      }
    }
    .cornerRadius(19)
  }
}

import GroupCreateFeature
import SwiftUI

public struct AppView: View {

  public init() {}

  public var body: some View {
    NavigationView {
      GroupCreateView()
        .navigationBarHidden(true)
    }
  }
}

struct AppViewPreview: PreviewProvider {
  static var previews: some View {
    AppView()
  }
}

import SwiftUI

public struct SettingView: View {

  public init() {}

  public var body: some View {
    List {
      Section {
        Text("お問い合わせ")
        Text("利用規約")
        Text("プライバシーポリシー")
      }
      Section {
        HStack {
          Text("バージョン")
          Spacer()
          Text("2021.4.19(183902)")
        }
      }
    }
    .navigationTitle("設定")
  }
}

struct SettingViewPreview: PreviewProvider {
  static var previews: some View {
    SettingView()
  }
}

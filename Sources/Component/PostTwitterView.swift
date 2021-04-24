import SwiftUI

public struct PostTwitterView: View {

  public init() {}

  public var body: some View {
    VStack(spacing: 8) {
      PostMemberInfoView(mediaType: .twitter, name: "ゆうこす")

      Text(
        "お風呂上がりに、スチーム当てながらスキンケアして、全身にクリーム塗って、軽めの筋トレとストレッチ、サプリメントを飲んで、白湯で温まって、アロマをたいて、リップクリームをたっぷり塗って、ハンドクリームまで塗って、、、今日はめちゃくちゃ美容を楽しめた夜でした、、❤︎❤︎おやすみ！"
      )
      .lineLimit(nil)
      .fixedSize(horizontal: false, vertical: true)

      HStack {
        Text("2020/01/01")
          .foregroundColor(.secondary)
        Spacer()
      }
    }
    .padding(.all, 16)
  }
}

struct PostTwitterViewPreview: PreviewProvider {
  static var previews: some View {
    PostTwitterView()
      .previewLayout(.sizeThatFits)
  }
}

import Entity
import SwiftUI

struct GroupRowView: View {
    
    var group: Entity.Group
    
    var body: some View {
        HStack(alignment: .center, spacing: 8, content: {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48)
                .background(Color.gray)
                .clipShape(Circle())
            
            Text(group.name)
            
            Spacer()
        })
    }
}

struct GroupRowViewPreviews: PreviewProvider {
    static var previews: some View {
        GroupRowView(
            group: .init(
                id: 1,
                name: "ゆうこす"
            )
        )
        .previewLayout(.sizeThatFits)
    }
}

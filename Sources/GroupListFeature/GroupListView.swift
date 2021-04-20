import SwiftUI

public struct GroupListView: View {
    
    public init() { }
    
    public var body: some View {
        NavigationView {
            ScrollView {
                ForEach(1...10, id: \.self) { count in
                    GroupRowView(group: .init(id: count, name: "\(count)"))
                }
            }
            .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
            .navigationViewStyle(DefaultNavigationViewStyle())
            .navigationTitle("Group List")
        }
    }
}

struct GroupListViewPreviews: PreviewProvider {
    static var previews: some View {
        GroupListView()
    }
}

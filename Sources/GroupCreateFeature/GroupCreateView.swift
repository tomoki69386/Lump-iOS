import SwiftUI

public struct GroupCreateView: View {
    
    @State var text = "" {
        didSet {
            print(text)
        }
    }
    
    public init() { }
    
    public var body: some View {
        VStack {
            Spacer()
            TextField("username", text: $text)
                .font(.title)
                .padding(.all, 20)
            Spacer()
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("←")
                        .frame(width: 50, height: 50)
                        .font(.title)
                        .background(Color(UIColor.systemGray5))
                        .clipShape(Circle())
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("→")
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .font(.title)
                        .background(Color(UIColor.systemPink))
                        .clipShape(Circle())
                        .disabled(text.isEmpty)
                })
                
            }
            .padding(.all, 16)
        }
    }
}

struct GroupCreateViewPreviews: PreviewProvider {
    static var previews: some View {
        GroupCreateView()
    }
}

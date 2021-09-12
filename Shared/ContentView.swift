import SwiftUI

struct ContentView: View {
    
    private let gradient = Gradient(colors: [Color(red: 0.12, green: 0.24, blue: 0.45), Color(red: 0.16, green: 0.32, blue: 0.60)]);
    
    @State private var modalViewActive = false
    @State var offset = CGSize.zero
    
    var body: some View {
        NavigationView {
            
            GeometryReader { bounds in
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: gradient,
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                        .edgesIgnoringSafeArea(.all)
                    
                    BottomSheetView(modalViewActive: $modalViewActive, offset: $offset, width: bounds.size.height / 1.5, contentView: AnyView( VStack {
                        Image(uiImage: #imageLiteral(resourceName: "jobs"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: bounds.size.width / 1.5, height: bounds.size.height / 4)
                        
                        Text("Hola, soy Steve. Abre el regalo.")
                            .foregroundColor(.white)
                    }), contentModal: AnyView( ContentBottomSheetView(modalViewActive: $modalViewActive, width: bounds.size.width / 1.4, height: bounds.size.height / 4) ) )
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        modalViewActive.toggle()
                    }, label: {
                        Image(systemName: "gift")
                    })
                }
            }
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

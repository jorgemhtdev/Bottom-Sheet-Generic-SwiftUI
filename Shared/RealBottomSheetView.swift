import SwiftUI

struct RealBottomSheetView<Content: View >: View {
    
    @Binding var modalViewActive: Bool
    var width: CGFloat
    let content: Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.white)
                .ignoresSafeArea()
                .opacity(0.6)
                .shadow(radius: 15)
            VStack() {
                VStack {
                    content
                }
                Spacer()
            }
        }
        .offset(y: width)
    }
}

struct RealBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        RealBottomSheetView(modalViewActive: .constant(true), width: (CGFloat(width)), content: Text("hola"))
    }
}

import SwiftUI

let width = 500

struct BottomSheetView<Content: View >: View  {
    
    @Binding var modalViewActive:Bool
    @Binding var offset:CGSize
    var width: CGFloat
    
    let contentView: Content
    let contentModal: Content
    
    var body: some View {
        ZStack {
            contentView
                .blur(radius: modalViewActive ? 10 : 0)
                .scaleEffect(modalViewActive ? 0.95 : 1)
            
            if modalViewActive {
                ZStack {
                    RealBottomSheetView(width: width, content: contentModal)
                }
                .animation(.easeInOut)
                .transition(.move(edge: .bottom))
                .offset(x: 0, y: offset.height > 0 ? offset.height : 0)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.offset.height = gesture.translation.height
                        }
                        .onEnded { _ in
                            if self.offset.height > (width / 8) {
                                withAnimation {
                                    modalViewActive.toggle()
                                }
                                self.offset = .zero
                            } else {
                                self.offset = .zero
                            }
                        }
                    
                )
            }
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    
    static var previews: some View {
        BottomSheetView(modalViewActive: .constant(true), offset: .constant(CGSize(width: 0, height: 0)), width: (CGFloat(width)), contentView: Text("Some Text"), contentModal: Text("BottomSheetView"))
            .background(
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color(red: 0.12, green: 0.24, blue: 0.45), Color(red: 0.16, green: 0.32, blue: 0.60)]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .edgesIgnoringSafeArea(.all))
    }
}

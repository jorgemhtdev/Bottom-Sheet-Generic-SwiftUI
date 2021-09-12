import SwiftUI

struct ContentBottomSheetView: View {
    
    @Binding var modalViewActive:Bool

    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        
        HStack(alignment: .top) {
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "jobs"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                Text("Hola, soy Steve. \nYo soy el regalo.")
                    .bold()
                    .foregroundColor(.red)
            }.overlay(
                HStack(alignment: .top) {
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation{
                            modalViewActive.toggle()
                        } 
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(30)
                })
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            )
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
        
    }
}

struct ContentBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentBottomSheetView(modalViewActive: .constant(true), width: 180, height: 180)
    }
}

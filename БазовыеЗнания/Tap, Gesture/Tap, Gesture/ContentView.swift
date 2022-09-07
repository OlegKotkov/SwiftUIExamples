








import SwiftUI

struct ContentView: View {
    var body: some View {
       Image("apple")
            .resizable()
            .aspectRatio( contentMode: .fit)
            .gesture(DragGesture(minimumDistance: 50)
                        .onEnded({ _ in
                print("Dragged")
            })
            )
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

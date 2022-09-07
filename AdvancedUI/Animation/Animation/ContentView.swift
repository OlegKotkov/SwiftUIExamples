

import SwiftUI

struct ContentView: View {
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Rectangle()
            .fill(Color.green)
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .onAppear {
                let baseAnimation = Animation.easeOut(duration: 2)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                return withAnimation(repeated){
                    self.scale = 0.5
                }
            }
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

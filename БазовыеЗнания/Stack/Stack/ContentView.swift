

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("image")
            Text("Хуй на")
                .frame(width: 100, height: 50, alignment: .center)
                .background(Color.green)
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

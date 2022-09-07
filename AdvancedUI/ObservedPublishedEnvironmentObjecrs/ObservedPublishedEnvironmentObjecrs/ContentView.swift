
import SwiftUI

struct ContentView: View {
    @ObservedObject var settings = UserSettings()
    
    var body: some View {
        VStack{
            Text("Your score is \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text ("increace score")
            }
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

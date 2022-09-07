
import SwiftUI

struct ContentView: View {
    @ObservedObject var settings = UDSettings()
   
    var body: some View {
        VStack(alignment: .center){
            Toggle(isOn: self.$settings.isOn) {
                Text("")
            }
            .fixedSize()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(settings.isOn ? Color.green : Color.blue)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

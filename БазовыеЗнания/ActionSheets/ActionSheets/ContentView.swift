

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    
    var body: some View {
        
        Button(action: {
            self.showSheet = true
        }) {
            Text("Show sheet")
        }.actionSheet(isPresented: $showSheet) {
            ActionSheet(title: Text("What do you want to do?"), message: Text("There is only one choice..."), buttons: [.default(Text("Dissmiss action sheet")), .cancel(), .destructive(Text("Delete"))])
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



import SwiftUI

struct ContentView: View {
   
    @State private var showAlert = false
    
    var body: some View {
     
        Button (action: {
            self.showAlert = true
        }) { Text("Show Alert")
        }.alert(isPresented: $showAlert){
            Alert(title: Text("khgfkhgkvkgkg"), message: Text("gfojhgjjkjbkjbk"), primaryButton: .destructive(Text("Delete")) {
                print("Deliting")
            }, secondaryButton: .cancel())
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

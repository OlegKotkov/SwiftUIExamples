

import SwiftUI

struct ContentView: View {
    var body: some View {
       Image("apple")
            .resizable()
            .frame(width: 300, height: 300)
            .padding()
            .contextMenu {
                VStack{
                    Button(action: {
                        //
                    }) {
                        HStack{
                            Image(systemName: "doc.on.doc")
                            Text("Copy")
                        }
                    }
                    
                    Button(action: {
                        //
                    }) {
                        HStack{
                            Image(systemName: "doc.on.doc")
                            Text("Save")
                        }
                    }
                }
            }
            
          
        
        
        
        
        
        
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

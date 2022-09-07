

import SwiftUI
struct DetailView: View{
    //Делаем кнопку для обратного перехода. Без этого обратно тоже можно переходить путем смахивания
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack{
        Text("Detail")
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back")
                    .font(.largeTitle)
            }
        }
    }
}
struct ContentView: View {
    @State private var showDetail = false
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
        }) {
            Text("ShowDetail")
        }.sheet(isPresented: $showDetail) {
            DetailView()
        }
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

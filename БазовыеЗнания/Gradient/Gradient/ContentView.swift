

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
         //Линейный градиент
         
        Text("Hello, world!")
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.black,.white]), startPoint: .top, endPoint: .bottom))
         */
        
        //Радиальнвй градиент
        /*
        let colors = Gradient(colors: [.red, .yellow, .green, .blue,. purple])
        let gradient = RadialGradient(gradient: colors, center: .center, startRadius: 50, endRadius: 200)
        return Circle()
            .fill(gradient)
            .frame(width: 400, height: 400)
        */
        
        //Угловой градиент
        
        let colors = Gradient(colors: [.red, .yellow, .green, .blue,. purple])
        let gradient = AngularGradient(gradient: colors, center: .center)
        return Circle()
        //полная заливка
            //.fill(gradient)
        // заливка линии
            .strokeBorder(gradient, lineWidth: 50)
        
        
        
        
        
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

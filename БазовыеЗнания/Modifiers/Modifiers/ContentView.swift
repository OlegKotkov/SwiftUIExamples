
import SwiftUI
struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.red)
            .background(Color.green)
    }
}
extension View {
    func customeM() -> some View {
        self.modifier(CustomModifier())
    }

}
struct ContentView: View {
    var body: some View {
          Text("Hello,  swift")
            .customeM()
        }
    }





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

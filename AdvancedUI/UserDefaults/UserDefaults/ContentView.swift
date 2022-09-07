
import SwiftUI


struct User: Codable {
    var firstName: String
    var secondName: String
}
struct ContentView: View {
   @State private var user = User(firstName: "Ivan", secondName: "Ivanov")
    var body: some View {
        Button("Save user") {
            let encoder = JSONEncoder()
            if let data = try?encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var mapAPI = MapAPI()
    @State private var text = ""
    var body: some View {
        NavigationView{
        VStack{
            TextField("", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Button("Search address") {
                mapAPI.getLocation(address: text, delta: 0.5)
            }
            Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations){
                location in
                MapMarker(coordinate: location.coordinate, tint: .blue)
            }
            .ignoresSafeArea()
        }.navigationTitle("Съеби в туман")
                
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

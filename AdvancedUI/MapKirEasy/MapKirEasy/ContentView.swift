
import SwiftUI
import MapKit

struct Location: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 02, longitudeDelta: 0.2))
    let locations = [
        Location(name: "Buckhingem palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    var body: some View {
        NavigationView{
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                NavigationLink{
                    Text(location.name)
                } label: {
                    Circle()
                        .stroke(.red, lineWidth: 5)
                        .frame(width: 44, height: 44)
                        //.onTapGesture {
                            //print(location.name)
                }
            }
        }.navigationTitle("London Explorer")
                .edgesIgnoringSafeArea(.all)
        }
       
        }
    }



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

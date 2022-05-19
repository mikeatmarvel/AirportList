//: A MapKit based Playground

import MapKit
import UIKit
import PlaygroundSupport

//let airport = USAirports(csap: "DTW", lat: 22, long: -10)

let paths = Bundle.main.paths(forResourcesOfType: "swift", inDirectory: nil)
print(paths)

func load(file named: String) -> String? {
    guard let fileUrl = Bundle.main.url(forResource: named, withExtension: "json") else {
        return nil
    }
    
    guard let content = try? String(contentsOf: fileUrl, encoding: .utf8) else {
        return nil
    }
    
    return content
}
print(load(file: "airport")!)

struct Welcome: Codable, Identifiable {
    let airports: Airports
}

struct Airports: Codable, Identifiable{
    let usa: [Usa]
    
    enum CodingKeys: String, CodingKey {
        case usa = "USA"
    }
}

struct Usa: Codable, Identifiable {
    let csap, lat, long: String
}

let decoder = JSONDecoder()
//let sample = try decoder.decode(airport, from: airport)




let appleParkWayCoordinates = CLLocationCoordinate2DMake(51.1894444, 4.460278004)

// Now let's create a MKMapView
let mapView = MKMapView(frame: CGRect(x:0, y:0, width:800, height:800))

// Define a region for our map view
var mapRegion = MKCoordinateRegion()

let mapRegionSpan = 0.5
mapRegion.center = appleParkWayCoordinates
mapRegion.span.latitudeDelta = mapRegionSpan
mapRegion.span.longitudeDelta = mapRegionSpan

mapView.setRegion(mapRegion, animated: true)

// Create a map annotation
let annotation = MKPointAnnotation()
annotation.coordinate = appleParkWayCoordinates
//annotation.title = "Apple Inc."
//annotation.subtitle = "One Apple Park Way, Cupertino, California."

mapView.addAnnotation(annotation)

// Add the created mapView to our Playground Live View
PlaygroundPage.current.liveView = mapView

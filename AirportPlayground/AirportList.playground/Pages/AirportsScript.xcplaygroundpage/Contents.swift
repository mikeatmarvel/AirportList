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

//var hlat =
//var llong = airport.long

//let woolooloo = Terminals()
//woolooloo.apterminals.map { terminal in
//    print(terminal)
//}

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

public class USAirports {
    public var csap: String
    public var lat: Double
    public var long: Double
    
    init(csap: String, lat: Double, long: Double){
        self.csap = csap
        self.lat = lat
        self.long = long
    }
}

public struct Terminals {
    public static let apterminals = [
        USAirports(csap: "BAW", lat: 51.1894444, long: 4.460278004),
        USAirports(csap: "BBE", lat: 50.75783338, long: 4.766999781),
        USAirports(csap: "BBL", lat: 51.1683334, long: 5.469722003),
        USAirports(csap: "BBR", lat: 50.9013889, long: 4.484444708),
        USAirports(csap: "BBT", lat: 51.34083331, long: 4.504444599),
        USAirports(csap: "BBX", lat: 49.89166662, long: 5.223888606),
        USAirports(csap: "BCI", lat: 50.45999989, long: 4.452777654),
        USAirports(csap: "BCV", lat: 50.57583343, long: 3.831110895),
        USAirports(csap: "BFN", lat: 51.09033343, long: 2.652833462),
        USAirports(csap: "YVI", lat: 54.63707507, long: 25.28780267)
    ]
}

func findTerminal(named terminalName: String) -> USAirports? {
    terminals.first(where: { $0.csap == terminalName })
}

let terminals = Terminals.apterminals

let term = Terminals.apterminals[1]

let terminalName = "BBL"

let airportLoc = findTerminal(named: terminalName)

airportLoc?.lat
airportLoc?.long
print(airportLoc?.lat ?? 00)

//: A MapKit based Playground

import MapKit
import UIKit
import PlaygroundSupport


let hlat : Double = 22
let llong : Double = 21

let airports = Airports.loadJSONFromFile(file: "airports", withExtension: "json")


guard let terminal = airports?.first,
      let termLat = Double(terminal.lat),
      let termLong = Double(terminal.long) else {
    fatalError("Error with airport data")
}

let location = terminal.csap
let appleParkWayCoordinates = CLLocationCoordinate2DMake(termLat, termLong)

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
annotation.title = location
annotation.subtitle = "One Apple Park Way, Cupertino, California."

mapView.addAnnotation(annotation)

// Add the created mapView to our Playground Live View
PlaygroundPage.current.liveView = mapView

//: A MapKit based Playground

import MapKit
import UIKit
import PlaygroundSupport


let hlat = 22
let llong = 21

let airports = Airports.loadJSONFromFile(file: "airports", withExtension: "json")

// Let's unrwap the object and make sure isn't nil
if let airports = airports {
    // Loop with high order functions (map, filter, reduce)
    airports.map { airports in
        print(airports.csap, airports.lat, airports.long)
    }
}

let terminal = airports?.first

let termLat = 31.41513906
let termLong = -102.3629196


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
//annotation.title = "Apple Inc."
//annotation.subtitle = "One Apple Park Way, Cupertino, California."

mapView.addAnnotation(annotation)

// Add the created mapView to our Playground Live View
PlaygroundPage.current.liveView = mapView

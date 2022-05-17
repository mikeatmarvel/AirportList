//: A MapKit based Playground

import MapKit
import UIKit
import PlaygroundSupport

let airport = USAirports(csap: "DTW", lat: 22, long: -10)

var hlat = airport.lat
var llong = airport.long


let appleParkWayCoordinates = CLLocationCoordinate2DMake(hlat, llong)

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

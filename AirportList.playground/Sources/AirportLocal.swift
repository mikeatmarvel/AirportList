import Foundation

public class USAirports {
    public var csap: String
    public var lat: Double
    public var long: Double
    
    public init(csap: String, lat: Double, long: Double){
        self.csap = csap
        self.lat = lat
        self.long = long
    }
}

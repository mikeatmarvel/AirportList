// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let airports: Airports
}

// MARK: - Airports
struct Airports: Codable {
    let usa: [Usa]

    enum CodingKeys: String, CodingKey {
        case usa = "USA"
    }
}

// MARK: - Usa
struct Usa: Codable {
    let csap, lat, long: String
}

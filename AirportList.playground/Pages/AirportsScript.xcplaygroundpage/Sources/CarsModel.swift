import Foundation


public struct Cars: Hashable, Codable {
    public var brand: String
    public var model: String
    
    // A static function because we don't want to instantiate the Structure.
    // If there's any error during opening, reading or decoding the file let's return an empty array
    public static func loadJSONFromFile(file: String, withExtension: String) -> [Self]? {
        // If it's unrwapped, let's store the results into the variable fileURL
        guard let fileURL = Bundle.main.url(forResource: file, withExtension: withExtension) else { fatalError("File not found!")}
        // Always handle errors properly!
        do {
            let jsonContentData = try Data(contentsOf: fileURL)
            return try? JSONDecoder().decode([Cars].self, from: jsonContentData)
        }
        catch {
            fatalError("Error reading file: \(error.localizedDescription)", file: #file, line: #line)
        }
    }
}

import Foundation
import SwiftUI

struct Recipes: Hashable, Codable {
    let name: String
    let ingredients: [Ingredient]
    let steps: [Step]
    private let imageURL: String
    
    var image: Image {
         Image(imageURL)
     }
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case ingredients, steps
    }
}

struct Ingredient: Hashable, Codable {
    let name, description: String
}

struct Step: Hashable, Codable {
    let number: Int
    let step: String
}

func load() -> [Recipes]? {
    var items: [Recipes]?
    if let path = Bundle.main.path(forResource: "data", ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            items = try JSONDecoder().decode([Recipes].self, from: data)
        } catch {
            print("Error loading data")
        }
    }
    return items
}

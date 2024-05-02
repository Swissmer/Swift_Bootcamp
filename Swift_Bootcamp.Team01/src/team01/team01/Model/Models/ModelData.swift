import Foundation
import RealmSwift

// MARK: - Для Alamofire
struct RecipesResponse: Decodable {
    var results: [Recipes]
}

struct Recipes: Decodable, Hashable, Equatable {
    var name: String
    var thumbnail_url: String
    var description: String
    var instructions: [Step]
}

struct Step: Decodable, Hashable, Equatable {
    var position: Int
    var display_text: String
}

// MARK: - Realm и RecipeView
class StepObject: Object {
    @Persisted var position: Int
    @Persisted var displayText: String
    
    convenience init(position: Int, displayText: String) {
        self.init()
        self.position = position
        self.displayText = displayText
    }
}

class RecipesAll: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var descript: String
    @Persisted var imageData: Data
    @Persisted var steps = List<StepObject>()
    
    convenience init(name: String, descript: String, imageData: Data, steps: [Step]) {
        self.init()
        self.name = name
        self.descript = descript
        self.imageData = imageData
        
        steps.forEach { step in
            let stepObject = StepObject(position: step.position, displayText: step.display_text)
            self.steps.append(stepObject)
        }
    }
}

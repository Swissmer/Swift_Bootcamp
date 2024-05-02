import Foundation
import RealmSwift

class Recipe: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var instructions: String
    @Persisted var imageURL: String
    
    convenience init(title: String, instructions: String, imageURL: String) {
        self.init()
        self.title = title
        self.instructions = instructions
        self.imageURL = imageURL
    }
}

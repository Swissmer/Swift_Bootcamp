import SwiftUI
import RealmSwift

// MARK: - Структура Recipe для View's
struct RecipeForView: Hashable, Equatable {
    var _id: ObjectId
    var name: String
    var descript: String
    var steps: [Step]
    var imageData: Data
    
    var image: Image {
        Image(uiImage: UIImage(data: imageData)!)
    }
}

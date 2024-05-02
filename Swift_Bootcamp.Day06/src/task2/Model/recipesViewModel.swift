import Foundation
import RealmSwift
import RxSwift
import RxRealm

class RecipesViewModel {
    private let realm: Realm
    
    init() {
        self.realm = try! Realm()
    }
    
    func createRecipe(_ obj: Recipe) {
        let recipe = Recipe(title: obj.title, instructions: obj.instructions, imageURL: obj.imageURL)
        try! self.realm.write {
            realm.add(recipe)
        }
    }
    
    func readRecipes() -> Observable<[Recipe]> {
        let recipesResults = self.realm.objects(Recipe.self)
        return Observable.array(from: recipesResults)
    }
    
    func updateRecipes(_ obj1: Recipe, _ obj2: Recipe) {
        if let recipe = self.realm.object(ofType: Recipe.self, forPrimaryKey: obj1._id) {
            try! realm.write {
                recipe.title = obj2.title
                recipe.instructions = obj2.instructions
                recipe.imageURL = obj2.imageURL
            }
        }
    }
    
    func deleteRecipe(_ obj: Recipe) {
        if let recipe = self.realm.object(ofType: Recipe.self, forPrimaryKey: obj._id) {
            try! realm.write {
                realm.delete(recipe)
            }
        }
    }
    
    func findRecipe(_ title: String) -> Recipe? {
        let value = self.realm.objects(Recipe.self).filter{
            $0.title == title
        }.first
        
        return value
    }
    
    func deleteAllRecipes() {
        try? self.realm.write {
            self.realm.deleteAll()
        }
    }

}

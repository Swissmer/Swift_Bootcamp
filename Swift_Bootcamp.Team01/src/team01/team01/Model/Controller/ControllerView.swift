import Foundation
import RealmSwift
import Swinject

// MARK: - Контроллер для recipes
class ViewController {
    var recipes: RecipeRepository
    private var container = Container()
    
    init() {
        container.register(NetworkService.self) { _ in NetworkServiceImpl()}
        container.register(DatabaseService.self) { _ in DatabaseServiceImpl()}
        container.register(RecipeRepository.self) { r in
            let networkService = r.resolve(NetworkService.self)
            let databaseSevice = r.resolve(DatabaseService.self)
            return RecipeRepository(networkService: networkService!, databaseService: databaseSevice!)
        }

        self.recipes = container.resolve(RecipeRepository.self)!
    }
    
}
